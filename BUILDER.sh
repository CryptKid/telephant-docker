#!/bin/bash
go get -d -u -v github.com/muesli/telephant
cd $(go env GOPATH)/src/github.com/muesli/telephant
$(go env GOPATH)/bin/qtdeploy build desktop .

