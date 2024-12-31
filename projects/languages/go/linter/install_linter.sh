#!/bin/bash

echo "Устанавливаем golangci-lint..."
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

echo "golangci-lint установлен."