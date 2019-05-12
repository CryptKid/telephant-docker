#!/bin/bash
mkdir -p $(go env GOPATH)/src/github.com/muesli
cd $(go env GOPATH)/src/github.com/muesli
git clone https://github.com/muesli/telephant.git

cd telephant
go get -u -v
$(go env GOPATH)/bin/qtdeploy build desktop .

