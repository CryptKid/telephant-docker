FROM golang:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y
RUN apt-get install ca-certificates  git -y
RUN apt-get -y --no-install-recommends install build-essential libglib2.0-dev libglu1-mesa-dev libpulse-dev
RUN apt-get -y --no-install-recommends install libqt*5-dev qt*5-dev qt*5-doc-html qml-module-qtquick*
#QT MAGIC
ENV QT_PKG_CONFIG=true
RUN go get -u -v -tags=no_env github.com/therecipe/qt/cmd/...
RUN $(go env GOPATH)/bin/qtsetup -test=false
# Build it
ADD BUILDER.sh /
VOLUME ["/result"]
ENTRYPOINT ["/BUILDER.sh"]
