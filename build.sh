#!/usr/bin/env bash

PATH=$PATH:~/go/bin

cd frontend && npm install && npm run build && cd ..

packr2

CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -ldflags "-linkmode external -extldflags -static -s -w" -o ovpn-admin

packr2 clean
