![Yoda Logo](src/logo.jpg "Yoda")

A simple method to collect your links and saves into a file using Shell Script.

**"May the Force be with you."**


## How it works?
First of all, define where you want to save your "readlater" file, then make this script executable to easily run it.

### Use the Force

```bash

# 1. Clone this repository
$ git clone git://github.com/vitorbritto/yoda.git

# 2. Place the `yoda.sh` script wherever you want

# 3. Set the filename and dirname to your favorites in `yoda.sh`
FILE="FAVORITES.md"
DIR="Desktop"

# 4. Make the script executable
$ chmod u+x path/to/yoda.sh

```

### Train Yourself

-  Ask **Yoda** to use the force: `./yoda.sh 'ENTER URL HERE'`
-  Check what **Yoda** saves: `./yoda.sh [ -l, --list ]`
-  Feel the force of your favorites: `./yoda.sh [ -o, --open ]`

### Become a Jedi

If you prefer, put the following **alias** inside your `~./.bashrc` file:

    alias yoda="bash ~/path/to/yoda.sh"

Now, you can simply run:

- `yoda 'ENTER URL HERE'`
- `yoda -l, --list`
- `yoda -o, --open`


## License

[MIT License](http://vitorbritto.mit-license.org/) © Vitor Britto
