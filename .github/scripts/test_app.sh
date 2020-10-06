#!/bin/bash

set -eo pipefail

xcodebuild -project iOSTestProject.xcodeproj \
            -scheme iOSTestProject \
            -destination platform=iOS\ Simulator,OS=13.3,name=iPhone\ 11 \
            clean test | xcpretty
