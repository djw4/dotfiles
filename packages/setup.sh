#!/usr/bin/env bash

set -eu

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install formulae
echo "Installing formulae.."
for f in $(cat ${SCRIPT_DIR}/formulae); do
    echo "* ${f}";
    brew install --quiet $f;
done

# Install casks
echo ""
echo "Installing casks.."
for c in $(cat ${SCRIPT_DIR}/casks); do
    echo "* ${c}";
    brew install --cask --quiet $c;
done

# Update the records if required
brew leaves > ${SCRIPT_DIR}/formulae
brew list --casks > ${SCRIPT_DIR}/casks
