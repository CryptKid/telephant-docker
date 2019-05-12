FROM ubuntu:rolling
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y
RUN apt-get --no-install-recommends install build-essential  libglib2.0-dev libglu1-mesa-dev libpulse-dev -y
RUN apt-get --no-install-recommends install libqt*5-dev qt*5-dev qt*5-doc-html qml-module-qtquick* -y
RUN apt-get install ca-certificates golang-go git -y
#QT MAGIC
ENV QT_PKG_CONFIG=true
RUN $(go env GOPATH)/bin/qtsetup -test=false
RUN go get -u -v -tags=no_env github.com/therecipe/qt/cmd/...
RUN $(go env GOPATH)/bin/qtsetup -test=false
# Build it
ADD BUILDER.sh /
ENTRYPOINT ["/BUILDER.sh"]
