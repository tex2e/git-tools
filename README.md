# picnic(1) -- deploy git without sudo/root

picnic deploys Git without root permission.
It downloads source code and compile them. finally, install them in `~/picnic-tools`.
Note: this is tested only **Ubuntu** terminal.


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
