# cspell-cli

## Setup [pre-commit](https://pre-commit.com) Hook

This repository enables using [cspell](https://github.com/streetsidesoftware/cspell) as a [pre-commit](https://pre-commit.com) hook.

<!-- x-release-please-start-version -->

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/streetsidesoftware/cspell-cli
    rev: v8.4.0
    hooks:
      - id: cspell
```

<!-- x-release-please-end -->

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

[Package cspell](https://github.com/streetsidesoftware/cspell-cli/pkgs/container/cspell)

```sh
docker run -v $PWD:/workdir ghcr.io/streetsidesoftware/cspell:latest "**"
```

## Usage

`cspell --help`:

<!--- @@inject: static/help.txt --->

```
Usage: cspell [options] [command]

Spelling Checker for Code

Options:
  -V, --version                         output the version number
  -h, --help                            display help for command

Commands:
  lint [options] [globs...]             Check spelling
  trace [options] [words...]            Trace words -- Search for words in the
                                        configuration and dictionaries.
  check [options] <files...>            Spell check file(s) and display the
                                        result. The full file is displayed in
                                        color.
  suggestions|sug [options] [words...]  Spelling Suggestions for words.
  link                                  Link dictionaries and other settings to
                                        the cspell global config.
  help [command]                        display help for command
```

<!--- @@inject-end: static/help.txt --->

### Lint

`lint` is the default command.

`cspell lint --help`:

<!--- @@inject: static/help-lint.txt --->

```
Usage: cspell lint [options] [globs...] [file://<path> ...] [stdin[://<path>]]

Patterns:
 - [globs...]            Glob Patterns
 - [stdin]               Read from "stdin" assume text file.
 - [stdin://<path>]      Read from "stdin", use <path> for file type and config.
 - [file://<path>]       Check the file at <path>

Examples:
    cspell .                        Recursively check all files.
    cspell lint .                   The same as "cspell ."
    cspell "*.js"                   Check all .js files in the current directory
    cspell "**/*.js"                Check all .js files recursively
    cspell "src/**/*.js"            Only check .js under src
    cspell "**/*.txt" "**/*.js"     Check both .js and .txt files.
    cspell "**/*.{txt,js,md}"       Check .txt, .js, and .md files.
    cat LICENSE | cspell stdin      Check stdin
    cspell stdin://docs/doc.md      Check stdin as if it was "./docs/doc.md"

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
  --no-exit-code               Do not return an exit code if issues are found.
  --quiet                      Only show spelling issues or errors.
  --fail-fast                  Exit after first file with an issue or error.
  -r, --root <root folder>     Root directory, defaults to current directory.
  --no-relative                Issues are displayed with absolute path instead
                               of relative to the root.
  --show-context               Show the surrounding text around an issue.
  --show-suggestions           Show spelling suggestions.
  --no-show-suggestions        Do not show spelling suggestions or fixes.
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
  --validate-directives        Validate in-document CSpell directives.
  --no-validate-directives     Do not validate in-document CSpell directives.
  --no-color                   Turn off color.
  --color                      Force color.
  --no-default-configuration   Do not load the default configuration and
                               dictionaries.
  --debug                      Output information useful for debugging
                               cspell.json files.
  --reporter <module|path>     Specify one or more reporters to use.
  -h, --help                   display help for command

More Examples:

    cspell "**/*.js" --reporter @cspell/cspell-json-reporter
        This will spell check all ".js" files recursively and use
        "@cspell/cspell-json-reporter".

    cspell . --reporter default
        This will force the default reporter to be used overriding
        any reporters defined in the configuration.

    cspell . --reporter ./<path>/reporter.cjs
        Use a custom reporter. See API for details.

References:
    https://cspell.org
    https://github.com/streetsidesoftware/cspell
```

<!--- @@inject-end: static/help-lint.txt --->

### Trace

`cspell trace --help`:

<!--- @@inject: static/help-trace.txt --->

```
Usage: cspell trace [options] [words...]

Trace words -- Search for words in the configuration and dictionaries.

Options:
  -c, --config <cspell.json>  Configuration file to use.  By default cspell
                              looks for cspell.json in the current directory.
  --locale <locale>           Set language locales. i.e. "en,fr" for English
                              and French, or "en-GB" for British English.
  --language-id <language>    Use programming language. i.e. "php" or "scala".
  --allow-compound-words      Turn on allowCompoundWords
  --no-allow-compound-words   Turn off allowCompoundWords
  --ignore-case               Ignore case and accents when searching for words.
  --no-ignore-case            Do not ignore case and accents when searching for
                              words.
  --dictionary-path <format>  Configure how to display the dictionary path.
                              (choices: "hide", "short", "long", "full",
                              default: Display most of the path.)
  --stdin                     Read words from stdin.
  --all                       Show all dictionaries.
  --only-found                Show only dictionaries that have the words.
  --no-color                  Turn off color.
  --color                     Force color
  --no-default-configuration  Do not load the default configuration and
                              dictionaries.
  -h, --help                  display help for command
```

<!--- @@inject-end: static/help-trace.txt --->

### Check

`cspell check --help`:

<!--- @@inject: static/help-check.txt --->

```
Usage: cspell check [options] <files...>

Spell check file(s) and display the result. The full file is displayed in
color.

Options:
  -c, --config <cspell.json>  Configuration file to use.  By default cspell
                              looks for cspell.json in the current directory.
  --validate-directives       Validate in-document CSpell directives.
  --no-validate-directives    Do not validate in-document CSpell directives.
  --no-color                  Turn off color.
  --color                     Force color
  --no-exit-code              Do not return an exit code if issues are found.
  --no-default-configuration  Do not load the default configuration and
                              dictionaries.
  -h, --help                  display help for command
```

<!--- @@inject-end: static/help-check.txt --->

### Suggestions

`cspell suggestions --help`:

<!--- @@inject: static/help-suggestions.txt --->

```
Usage: cspell suggestions|sug [options] [words...]

Spelling Suggestions for words.

Options:
  -c, --config <cspell.json>            Configuration file to use.  By default
                                        cspell looks for cspell.json in the
                                        current directory.
  --locale <locale>                     Set language locales. i.e. "en,fr" for
                                        English and French, or "en-GB" for
                                        British English.
  --language-id <language>              Use programming language. i.e. "php" or
                                        "scala".
  -s, --no-strict                       Ignore case and accents when searching
                                        for words.
  --ignore-case                         Alias of --no-strict.
  --num-changes <number>                Number of changes allowed to a word
                                        (default: 4)
  --num-suggestions <number>            Number of suggestions (default: 8)
  --no-include-ties                     Force the number of suggested to be
                                        limited, by not including suggestions
                                        that have the same edit cost.
  --stdin                               Use stdin for input.
  --repl                                REPL interface for looking up
                                        suggestions.
  -v, --verbose                         Show detailed output.
  -d, --dictionary <dictionary name>    Use the dictionary specified. Only
                                        dictionaries specified will be used.
  --dictionaries <dictionary names...>  Use the dictionaries specified. Only
                                        dictionaries specified will be used.
  --no-color                            Turn off color.
  --color                               Force color
  -h, --help                            display help for command
```

<!--- @@inject-end: static/help-suggestions.txt --->

### Link

`cspell link --help`:

<!--- @@inject: static/help-link.txt --->

```
Usage: cspell link [options] [command]

Link dictionaries and other settings to the cspell global config.

Options:
  -h, --help               display help for command

Commands:
  list|ls                  List currently linked configurations.
  add|a <dictionaries...>  Add dictionaries any other settings to the cspell
                           global config.
  remove|r <paths...>      Remove matching paths / packages from the global
                           config.
  help [command]           display help for command
```

<!--- @@inject-end: static/help-link.txt --->

## Versioning

The major version of `cspell-cli` tries to match the major version of `cspell`.

`minor` and `patch` versioning goes up independently from `cspell`. Where possible, the `minor` version should match `cspell`.
