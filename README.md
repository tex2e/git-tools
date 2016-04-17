# picnic(1) -- deploy git without sudo/root

picnic deploys git without root permission.
It downloads **Ubuntu packages** and install them in `~/picnic-tools`


## Getting Started

Paste that at a Terminal prompt,

    wget https://raw.githubusercontent.com/TeX2e/picnic/master/picnic
    chmod +x picnic
    ./picnic unpack

and export PATH to use git.

    export PATH="$PATH:$HOME/picnic-tools/bin"


## SYNOPSIS

    picnic <command>


## COMMANDS

- `unpack`
    * deploy git in `~/picnic-tools`
- `remove`
    * remove all installed packages via picnic


## License

code is under the MIT license
