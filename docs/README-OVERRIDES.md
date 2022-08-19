# Using CSpell overrides
<!--- cspell:ignore esac getopts shopt --->

This is the same for use with `pre-commit` as with other methods of invoking
`cspell`, namely configuring an `overrides` section on your `cspell.json`
or equivalent file.

The [current overrides documentation on the
website](https://cspell.org/configuration/overrides/) is rather sparse, so here
is another example.

## Using Bash dictionary with Markdown or text files by filename

Given a `cspell.json` as follows:

``` json
{
  "language": "en",
  "overrides": [
      {
          "dictionaries": [
              "bash"
          ],
          "filename": "**/{*.md,*.txt}"
      }
  ],
  "version": "0.2"
}
```

And the following, as `test1.md` and as `test1.err`:

```` markdown
## Sample code block

```sh
if grep -r "something" .; then
    echo "Found"
fi

case "a string with 3" in
with)
    echo "Why?"
    ;;
esac

. ./.bash_aliases

# We should use getopts

shopt -p
```

## And another topic

Words, many words.
````

When `cspell` is invoked `test1.md` should not show errors, but `test1.err`
should.

## Invoking CSpell

### `pre-commit`

Use a config such as the one in the [README.md](../README.md), stage all files
(e.g. `git add --all .`), and execute:

``` bash
pre-commit run --all-files
```

or commit the changes

``` bash
git commit
```

### Command line

`cspell ./test1.*`
