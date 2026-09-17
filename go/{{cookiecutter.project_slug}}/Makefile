.PHONY: test clean help

PROJECT_SLUG={{ cookiecutter.project_slug }}

# Default target
help:
	@echo "Available commands:"
	@echo "  make test               - Run all tests"
	@echo "  make test.unit          - Run Go unit tests"
	@echo "  make build              - Build the project"
	@echo "  make clean              - Remove build artifacts"

test: test.unit

test.unit:
	@echo "Running Go unit tests..."
	go test -cover -v ./...

build:
	@echo "Building Go application..."
	go build -o bin/$(PROJECT_SLUG) main.go

clean:
	@echo "Cleaning Go build and test cache..."
	rm -rf bin/
	go clean -cache -testcache
	@echo "Clean completed!"
