git config --global core.editor nvim # set neovim as the default editor

# Resolving merge conflicts
git config --global merge.conflictstyle diff3 # improve merge conflict presentation
git config --global mergetool.neovim.cmd 'nvim -d "$MERGED"'
git config --global merge.tool neovim
git config --global mergetool.keepBackup false

# Diff managing
git config --global diff.colorMoved true
git config --global difftool.neovim.cmd 'nvim -d "$LOCAL" "$REMOTE"'
git config --global diff.tool neovim
git config --global diff.prompt false

# Always enable coloring
git config --global color.ui auto

# Set default branch when using 'git init'
git config --global init.defaultBranch master

# Turn off some annoying hints
git config --global advice.statusHints off
