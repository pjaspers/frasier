## What does it do?

Generates phrases using words out of a book. Using high tech computering.

Those phrases can be used as passphrases, you can set how many words and which books, so you can claim to have passphrase inspired by Great Literature.

For example using 'The Great Gatsby' it generates easy to remember* phrases like:

- `gloved modelling pool daylight longer`
- `wrong flirtation great bembergs happier`
- `obscurity flat quarter nodding libel`

`gem install frasier` and you're good to go.

* Note: not actually easy to remember.

## Isn't this Diceware™?

Inspired by [Diceware™](http://world.std.com/~reinhold/diceware.html), except instead of being cryptogaphically sound, this uses not a carefully created word list but uses text from books.

```
Diceware™ is a method for picking passphrases that uses dice to select words at random from a special list called the Diceware Word List. Each word in the list is preceded by a five digit number. All the digits are between one and six, allowing you to use the outcomes of five dice rolls to select one unique word from the list.
```

It uses a simple `rand` to simulate the dice roll, the original [Diceware™](http://world.std.com/~reinhold/diceware.html) recommends against this.

Having said all that, it's safer then creating "th3Ult1mat2Pa$$word" for each service you encounter.


## How do I get books?

[Project Gutenberg](http://www.gutenberg.org) has some classics which can be freely downloaded as plain text, after that save them in `~/.config/frasier/` and you're good to go.

## What's with the name?

You're on a need to know basis.

## Usage

```
Usage: frasier [options]
    -n, --number [NUMBER]            Generate passphrase with <n> words
    -l, --list-books                 List available books
    -b, --book [NAME]                Specify book to generate from
    -i, --info                       Show entropy info
    -h, --help                       Show this message
        --version                    Show version
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Do some awesome computering
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
