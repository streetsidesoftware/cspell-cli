# Using Extra Dictionaries from `cspell-dicts` with `pre-commit`

<!--- cspell:ignore reforme nlnl --->

Most dictionaries bundled with `cspell` are active by default in appropriate contexts (e.g., the public-licenses dictionary is enabled automatically). Non-English language dictionaries are not enabled by default and must be explicitly added.

To use a language dictionary:

1. Add it as an `additional_dependency` in `.pre-commit-config.yaml`
2. Import it in `cspell.json`

For a complete list of available dictionaries, see: <https://github.com/streetsidesoftware/cspell-dicts>.

## Checking a Dictionary's Default Context

View the `cspell-ext.json` for any dictionary to see when it is applied by default:

`https://github.com/streetsidesoftware/cspell-dicts/blob/main/dictionaries/<dictionary-name>/cspell-ext.json`

For example: <https://github.com/streetsidesoftware/cspell-dicts/blob/main/dictionaries/public-licenses/cspell-ext.json>

## Example: Adding a Dutch Dictionary

### `.pre-commit-config.yaml`

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/streetsidesoftware/cspell-cli
    rev: v10.0.1
    hooks:
      - id: cspell
        additional_dependencies:
          - '@cspell/dict-nl-nl'
```

### `cspell.json`

To make the `nl-nl` dictionary available:

```json
{
  "$schema": "https://raw.githubusercontent.com/streetsidesoftware/cspell/main/cspell.schema.json",
  "import": ["@cspell/dict-nl-nl/cspell-ext.json"],
  "version": "0.2"
}
```

To also set Dutch as the default locale:

```json
{
  "$schema": "https://raw.githubusercontent.com/streetsidesoftware/cspell/main/cspell.schema.json",
  "import": ["@cspell/dict-nl-nl/cspell-ext.json"],
  "language": "nl-nl",
  "version": "0.2"
}
```

## See Also

- [Example `pre-commit` Setup for French](pre-commit-example-setup-for-french.md)
- [Use an Extra Dictionary Based on the Folder or Filename](file-or-folder-based-overrides.md)
- [Setup pre-commit Hook](../README.md#setup-pre-commit-hook)
