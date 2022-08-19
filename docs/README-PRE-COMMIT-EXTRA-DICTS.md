# Using extra CSpell dictionaries with `pre-commit`

## Common configuration

### `pre-commit-config.yaml` configuration

Extend the `pre-commit` hook config from the [README.md](../README.md) with
`additional_dependencies`. For example:

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/streetsidesoftware/cspell-cli
    rev: v6.2.0
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

A file such as `test2.md` containing:

```markdown
# Testing french in Markdown

## Les mots

Voici, nous avons les mots française.
```

When `cspell` is invoked `test2.md` should not show errors

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
      "filename": "**/{*.md,*.txt}",
      "language": "fr,fr-fr,fr-90"
    }
  ],
  "version": "0.2"
}
```

And the following, as `test2.md` and as `test2.err`:

``` markdown
# Testing french in Markdown

## Les mots

Voici, nous avons les mots française
```

When `cspell` is invoked `test2.md` should not show errors, but `test2.err`
should.

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

`cspell ./test2.*`
