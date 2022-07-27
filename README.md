# cspell-cli

## Setup [pre-commit](https://pre-commit.com) Hook

This repository enables using [cspell](https://github.com/streetsidesoftware/cspell) as a [pre-commit](https://pre-commit.com) hook.

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/streetsidesoftware/cspell-cli
    rev: v6.2.0
    hooks:
      - id: cspell
```

## Setup Custom Dictionary

To use a custom dictionary with the `pre-commit` hook, create either a `cspell.config.yaml` or `cspell.json` file in your project's root directory.

`cspell.config.yaml`

```yaml
dictionaryDefinitions:
  - name: myWords
    path: ./path/to/cSpell_dict.txt
    addWords: true
dictionaries:
  - myWords
```

`cSpell.json`

```json
{
  "dictionaryDefinitions": [
    {
      "name": "myWords",
      "path": "./path/to/cSpell_dict.txt",
      "addWords": true
    }
  ],
  "dictionaries": ["myWords"]
}
```

If you installed the [Code Spell Checker extension](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) for VS Code, this can be done automatically from the command palette by running "Spell: Create a CSpell configuration file".

## Install from GitHub

This repo also allows installing the `cspell-cli` directly from GitHub:

```
npm install -g git+https://github.com/streetsidesoftware/cspell-cli
```

## Docker

```sh
docker run -v $PWD:/workdir ghcr.io/streetsidesoftware/cspell:latest "**"
```

## Usage

```
Usage: cspell lint [options] [globs...]

Check spelling

Options:
  -c, --config <cspell.json>   Configuration file to use.  By default cspell
                               looks for cspell.json in the current directory.

  -v, --verbose                Display more information about the files being
                               checked and the configuration.

  --locale <locale>            Set language locales. i.e. "en,fr" for English
                               and French, or "en-GB" for British English.

  --language-id <language>     Force programming language for unknown
                               extensions. i.e. "php" or "scala"

  --words-only                 Only output the words not found in the
                               dictionaries.

  -u, --unique                 Only output the first instance of a word not
                               found in the dictionaries.

  -e, --exclude <glob>         Exclude files matching the glob pattern. This
                               option can be used multiple times to add
                               multiple globs.

  --file-list <path or stdin>  Specify a list of files to be spell checked. The
                               list is filtered against the glob file patterns.
                               Note: the format is 1 file path per line.

  --no-issues                  Do not show the spelling errors.
  --no-progress                Turn off progress messages
  --no-summary                 Turn off summary message in console.
  -s, --silent                 Silent mode, suppress error messages.
  --fail-fast                  Exit after first file with an issue or error.
  -r, --root <root folder>     Root directory, defaults to current directory.
  --relative                   Issues are displayed relative to root.
  --show-context               Show the surrounding text around an issue.
  --show-suggestions           Show spelling suggestions.
  --no-must-find-files         Do not error if no files are found.
  --cache                      Use cache to only check changed files.
  --no-cache                   Do not use cache.
  --cache-reset                Reset the cache file.
  --cache-strategy <strategy>  Strategy to use for detecting changed files.
                               (choices: "metadata", "content")
  --cache-location <path>      Path to the cache file or directory. (default:
                               ".cspellcache")
  --dot                        Include files and directories starting with `.`
                               (period) when matching globs.
  --gitignore                  Ignore files matching glob patterns found in
                               .gitignore files.
  --no-gitignore               Do NOT use .gitignore files.
  --gitignore-root <path>      Prevent searching for .gitignore files past
                               root.
  --no-color                   Turn off color.
  --color                      Force color.
  --no-default-configuration   Do not load the default configuration and
                               dictionaries.
  --debug                      Output information useful for debugging
                               cspell.json files.
  -h, --help                   display help for command


Examples:
    cspell "*.js"                   Check all .js files in the current directory
    cspell "**/*.js"                Check all .js files from the current directory
    cspell "src/**/*.js"            Only check .js under src
    cspell "**/*.txt" "**/*.js"     Check both .js and .txt files.
    cspell "**/*.{txt,js,md}"       Check .txt, .js, and .md files.
    cat LICENSE | cspell stdin      Check stdin
```

## Versioning

The major version of `cspell-cli` tries to match the major version of `cspell`.

`minor` and `patch` versioning goes up independently from `cspell`.
