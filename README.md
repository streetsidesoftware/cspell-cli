# cspell-cli

## Setup [pre-commit](https://pre-commit.com) Hook

This repository enables using [cspell](https://github.com/streetsidesoftware/cspell) as a [pre-commit](https://pre-commit.com) hook.

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/streetsidesoftware/cspell-cli
    rev: v5.6.11
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
