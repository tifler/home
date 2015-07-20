#!/bin/sh

find . -name CMakeLists.txt -exec tizen-cmake-review.sh {} \;
