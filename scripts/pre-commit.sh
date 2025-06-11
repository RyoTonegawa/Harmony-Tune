#!/bin/sh

echo "Running gofmt..."
unformatted=$(gofmt -l .)
if [ -n "$unformatted" ]; then
  echo "These files are not properly formatted:"
  echo "$unformatted"
  exit 1
fi

echo "Running go vet..."
if ! go vet ./...; then
  echo "go vet failed"
  exit 1
fi

echo "Running go build..."
if ! go build ./...; then
  echo "go build failed"
  exit 1
fi

echo "All checks passed!"
