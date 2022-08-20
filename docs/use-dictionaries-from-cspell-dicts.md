# Using extra CSpell dictionaries with `pre-commit`

## Using dictionaries from `cspell-dicts`

This is mostly (only?) needed for language dictionaries. Most if not all other
dictionaries are installed (but not active except in particular contexts) by
default. For those dictionaries see [Using file or folder based
overrides](file-or-folder-based-overrides.md)

### More information on `cspell-dicts`

For a complete list of available dictionaries,
see: <https://github.com/streetsidesoftware/cspell-dicts>.

To see when the dictionary is applied by default, view

`https://github.com/streetsidesoftware/cspell-dicts/dictionaries/<dictionary-name>/cspell-ext.json`

### Viewing a dictionary's default context in `cspell-dicts`

View the file
`https://github.com/streetsidesoftware/cspell-dicts/blob/main/dictionaries/<dictionary-name>/cspell-ext.json`

For example: `https://github.com/streetsidesoftware/cspell-dicts/blob/main/dictionaries/public-licenses/cspell-ext.json`

``` json
// Turn on the dictionary by default.
// It can be turned off using `"dictionaries": ["!public-licenses"]
"dictionaries": ["public-licenses"],
"languageSettings": []
```

## Using non-English language dictionaries

For a non-English language dictionary, continue here, or the see the
[`pre-commit` example setup for French](pre-commit-example-setup-for-french.md).

### `pre-commit-config.yaml` configuration

Extend the `pre-commit` hook config from the [README.md](../README.md) with
`additional_dependencies`. For example:

```yaml
# .pre-commit-config.yaml
repos:
- repo: https://github.com/streetsidesoftware/cspell-cli
  rev: v6.7.0
  hooks:
  - id: cspell
    additional_dependencies:
    - "@cspell/dict-nl-nl"
```

### To make the 'nl-nl' dictionary available

Use a `cspell.json` such as the following:

```json
{
  "$schema": "https://raw.githubusercontent.com/streetsidesoftware/cspell/main/cspell.schema.json",
  "import": [
    "@cspell/dict-nl-nl/cspell-ext.json"
  ],
  "version": "0.2"
}
```

### To make 'nl-nl' the default locale and use `dict-nl-nl`:

Use a `cspell.json` such as the following:

```json
{
  "$schema": "https://raw.githubusercontent.com/streetsidesoftware/cspell/main/cspell.schema.json",
  "import": [
    "@cspell/dict-nl-nl/cspell-ext.json"
  ],
  "language": "nl-nl",
  "version": "0.2"
}
```

## Invoking CSpell

### `pre-commit`

With [pre-commit](https://pre-commit.com) installed:

1. Use a config such as the one above
2. Stage all files (e.g. `git add --all .`)
3. Execute:

   ``` bash
   pre-commit run --all-files
   ```

   OR commit the changes

   ``` bash
   git commit
   ```

### Command line

`cspell '**'`
