#!/bin/bash

# set -e
set -x

mkdir -p docs

rm -rf docs/*

cp CNAME docs/
cp 404.html docs/

mkdir -p "docs/$(cat sdickey)"
cp --recursive build/* "docs/$(cat sdickey)/"