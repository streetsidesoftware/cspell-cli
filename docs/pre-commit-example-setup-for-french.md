# Example `pre-commit` setup for French
<!--- cspell:ignore Voici nous avons française reforme --->

## Common configuration

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
          - "@cspell/dict-fr-fr"
          - "@cspell/dict-fr-reforme"

```

For a complete list of available dictionaries,
see: <https://github.com/streetsidesoftware/cspell-dicts>.

## Using French as the locale

Use a `cspell.json` such as the following:

```json
{
  "$schema": "https://raw.githubusercontent.com/streetsidesoftware/cspell/main/cspell.schema.json",
  "import": [
    "@cspell/dict-fr-fr/cspell-ext.json",
    "@cspell/dict-fr-reforme/cspell-ext.json"
  ],
  "language": "fr",
  "version": "0.2"
}
```

A file such as `mots-française.md` containing:

```markdown
# Testing french in Markdown

## Les mots

Voici, nous avons les mots française.
```

When `cspell` is invoked `mots-française.md` should not show errors

## Applying to specific files

And to apply those dictionaries to files with the `.md` extension (Markdown),
use a `cspell.json` such as:

```json
{
  "$schema": "https://raw.githubusercontent.com/streetsidesoftware/cspell/main/cspell.schema.json",
  "import": [
    "@cspell/dict-fr-fr/cspell-ext.json",
    "@cspell/dict-fr-reforme/cspell-ext.json"
  ],
  "overrides": [
    {
      "filename": "**/*.md",
      "language": "fr,fr-fr,fr-90"
    }
  ],
  "version": "0.2"
}
```

And the following, as `mots-française.md`:

``` markdown
# Testing french in Markdown

## Les mots

Voici, nous avons les mots française
```

as again as `mots-française.err`:

``` markdown
# Testing french in Markdown

## Les mots

Voici, nous avons les mots française
```

When `cspell` is invoked `mots-française.md` should not show errors, but
`mots-française.err` should.

## Invoking CSpell

### Via [`pre-commit`](https://pre-commit.com)

#### Prerequisites

* Project folder initialized as a git repository via `git init` or as part of a
git repository cloned via `git clone`
* ['pre-commit' installed](https://pre-commit.com/#install)
* A `.pre-commit-config.yaml` such as:

  ```yaml
  fail_fast: true
  minimum_pre_commit_version: 2.18.1

  repos:
  - repo: "https://github.com/streetsidesoftware/cspell-cli"
    rev: v6.7.0
    hooks:
    - id: cspell
  ```

#### Triggering CSpell using `pre-commit`

* Stage all files

  ```
  git add --all .
  ```

* Check all files in `git` against `pre-commit` hooks

  ``` bash
  pre-commit run --all-files
  ```

* OR commit the changes

  ``` bash
  git commit
  ```

### Via Command line

* Execute

  ``` bash
  cspell '**'
  ```
