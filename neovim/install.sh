#!/bin/bash

SCRIPT_ABSOLUTE_PATH=$(readlink -f "$0")
DIR_ABSOLUTE_PATH=$(dirname "$SCRIPT_ABSOLUTE_PATH")

NEOVIM_DIR="$HOME/.config/nvim"

echo "Copying NeoVim config"
if [ ! -d $NEOVIM_DIR ]; then
	mkdir $NEOVIM_DIR
fi

mv $NEOVIM_DIR/init.vim $NEOVIM_DIR/init.vim.old
cp $DIR_ABSOLUTE_PATH/init.vim $NEOVIM_DIR/init.vim

mkdir -p $NEOVIM_DIR/after/syntax
mv $NEOVIM_DIR/after/syntax/c.vim $NEOVIM_DIR/after/syntax/c.vim.old
cp $DIR_ABSOLUTE_PATH/c.vim $NEOVIM_DIR/after/syntax/c.vim

echo "Done!"
