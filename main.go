package main

import (
	"embed"
	"errors"
	"flag"
	"os"
	"text/template"
)

//go:embed templates/*
var content embed.FS

func main() {

	var repo, releasetag, releasesha string
	flag.StringVar(&repo, "repo", "", "Name of repo to generate brew update")
	flag.StringVar(&releasetag, "tag", "", "Release tag")
	flag.StringVar(&releasesha, "sha", "", "SHA256 for release bundle")
	flag.Parse()

	if releasesha == "" || releasetag == "" {
		panic(errors.New("missing required inputs"))
	}

	var t *template.Template
	var err error

	switch repo {
	case "wash":
		t, err = template.ParseFS(content, "templates/wash.rb.tmp")
	case "wasmcloud":
		t, err = template.ParseFS(content, "templates/wasmcloud.rb.tmp")
	default:
		panic(errors.New("missing required inputs"))
	}
	if err != nil {
		panic(err)
	}

	data := struct {
		ReleaseTag string
		Sha256     string
	}{
		ReleaseTag: releasetag,
		Sha256:     releasesha,
	}

	f, err := os.Create(repo + ".rb.new")
	if err != nil {
		panic(err)
	}
	// remember to close the file
	defer f.Close()

	err = t.Execute(f, data)
	if err != nil {
		panic(err)
	}
}
