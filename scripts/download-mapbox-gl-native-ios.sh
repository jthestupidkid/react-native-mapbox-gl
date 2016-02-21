#!/bin/sh

VERSION=$1

echo "Downloading Mapbox GL iOS $VERSION, this may take a minute."
cd ios/

if ! which curl > /dev/null; then echo "curl command not found. Please install curl"; exit 1; fi;
if ! which unzip > /dev/null; then echo "unzip command not found. Please install unzip"; exit 1; fi;

if [ -d ./Mapbox.framework ]; then
    echo "Old Mapbox.framework found. Removing it and installing a $VERSION"
    rm -rf ./Mapbox.framework
fi

curl -sS https://mapbox.s3.amazonaws.com/mapbox-gl-native/ios/builds/mapbox-ios-sdk-$VERSION.zip > temp.zip
unzip -o temp.zip -d temp
mv temp/static/Mapbox.framework ./Mapbox.framework
rm -r temp
rm temp.zip
