#!/usr/bin/env bash

source $DOT_FILES_DIR/utils.sh

if ! isCommandInstalled "pip"; then
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py --user
    rm get-pip.py
else
    echo -e "$RED 'pip' already installed $RESET"
fi

if ! isCommandInstalled "pyenv"; then
    curl https://pyenv.run | bash
else
    echo -e "$RED 'pyenv' already installed $RESET"
fi

# Install markdown formatter with pip
pip install mdformat-gfm mdformat-frontmatter mdformat-footnote mdformat-toc
