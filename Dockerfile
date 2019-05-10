FROM ubuntu:rolling
RUN apt update -y
RUN apt install golang-go git -y
RUN go get -u -v github.com/therecipe/qt/cmd/...
RUN mkdir -p $(go env GOPATH)/src/github.com/muesli
RUN echo $(go env GOPATH)
WORKDIR /root/go/src/github.com/muesli
RUN git clone https://github.com/muesli/telephant.git
WORKDIR telephant
RUN go get -u -v
RUN /root/go/bin/qtdeploy build desktop .
