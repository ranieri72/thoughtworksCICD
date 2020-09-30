#!/bin/bash

set -eo pipefail

xcodebuild -workspace iOSTestProject.xcworkspace \
            -scheme iOSTestProject\ iOS \
            -destination platform=iOS\ Simulator,OS=13.3,name=iPhone\ 11 \
            clean build | xcpretty
