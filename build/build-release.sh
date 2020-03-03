#!/bin/bash
set -euo pipefail
set -x

readonly REPO_ROOT=$(git rev-parse --show-toplevel)

cd /go/src/github.com/coreos/container-linux-update-operator && make clean all
