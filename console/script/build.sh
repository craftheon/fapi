#!/bin/bash
set -e
set -x
process_name=$1

function compile() {
  CGO_ENABLED=0
  GOOS=linux
  GOARCH=amd64
  go mod tidy
  go build -o main ./cmd/main.go
}

function make_output() {
  (
    compile &&
      rm -rf dist-server &&
      mkdir -p dist-server &&
      cp ./main dist-server
      rm -rf ./main
  ) || {
    echo "[make output error]"
    exit 1
  }
}

make_output

echo "[build done!]"
exit 0
