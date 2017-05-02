# git-tools(1) -- deploy git without sudo/root

git-tools deploys Git without root permission.
It downloads source code and compile them. finally, install them in `~/git-tools`.
Note: this is tested only **Ubuntu** terminal.

Git requires 4 packages, curl, expat, openssl and zlib.
First, git-tools installs these 4 packages. Next, installs Git.
So these 4 packages can be also used in the terminal.

## Getting Started

Paste that at a Terminal prompt,

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

code is under the MIT license
