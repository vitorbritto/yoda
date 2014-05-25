![Yoda Logo](src/yoda.jpg "Yoda")


## Welcome young Padawan

Yoda is a simple method to collect your links and saves into a file using Shell Script.

> May the Force be with you.


## Use the Force

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


## Train Yourself

- Ask **Yoda** to use the force: `./yoda.sh 'NAME' 'http://URL'`
- Check what **Yoda** saves: `./yoda.sh [ -l, --list ]`
- Feel the force of your favorites: `./yoda.sh [ -o, --open ]`
- Help you **Yoda** will: `./yoda.sh [ -h, --help ]`
- Ask **yoda** to export Bookmarks Chrome: `./yoda.sh [ -e, --export ]`

## Become a Jedi

If you prefer, put the following **alias** inside your `~./.bashrc` file:

    alias yoda="bash ~/path/to/yoda.sh"

Now, you can simply run:

- `yoda 'NAME' 'http://URL'`
- `yoda -l, --list`
- `yoda -o, --open`
- `yoda -h, --help`
- `yoda -e, --export`

## License

[MIT License](http://vitorbritto.mit-license.org/) © Vitor Britto
