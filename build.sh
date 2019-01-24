#!/bin/sh

cd $BOOKDIR

gitbook install
gitbook build
gitbook serve --no-live
