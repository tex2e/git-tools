
[![CircleCI](https://circleci.com/gh/tex2e/git-tools.svg?style=shield)](https://circleci.com/gh/tex2e/git-tools)

# git-tools(1) -- deploy git without sudo/root

git-tools deploys Git without root permission.
It downloads source code and compile them. finally, install them in `$HOME/git-tools`.
Note: this is tested only **Ubuntu** terminal.

Git requires 4 packages, curl, expat, openssl and zlib.
First, git-tools installs these 4 packages. Next, installs Git.
So these 4 packages can be also used in the terminal.

After all, adding a path (`$HOME/git-tools/bin`) to PATH, you can use git and gitk on your terminal.

## Getting Started

Paste following at a Terminal prompt,

    wget https://raw.githubusercontent.com/tex2e/git-tools/master/git-tools
    chmod +x git-tools
    ./git-tools unpack

and export PATH to use git.

    export PATH="$PATH:$HOME/git-tools/bin"


## SYNOPSIS

    git-tools <command>


## COMMANDS

- `unpack`
    * deploy git in `~/git-tools`
- `remove`
    * remove all installed packages via git-tools


## License

This code is under the MIT license
