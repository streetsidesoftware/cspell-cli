# Example `pre-commit` Setup for French

<!--- cspell:ignore Voici nous avons française reforme --->

## Configuration

### `.pre-commit-config.yaml`

Add French dictionary packages using `additional_dependencies`:

<!-- x-release-please-start-version -->

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/streetsidesoftware/cspell-cli
    rev: v10.0.1
    hooks:
      - id: cspell
        additional_dependencies:
          - '@cspell/dict-fr-fr'
          - '@cspell/dict-fr-reforme'
```

<!-- x-release-please-end -->

For a complete list of available dictionaries, see: <https://github.com/streetsidesoftware/cspell-dicts>.

## Using French as the Default Locale

Use a `cspell.json` such as:

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

A file `mots-française.md` containing:

```markdown
# Testing French in Markdown

## Les mots

Voici, nous avons les mots française.
```

With this configuration, `mots-française.md` will not show spelling errors.

## Applying French to Specific Files

To apply French dictionaries only to `.md` files while leaving other file types checked in English:

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

With this configuration:

```
project/
├── mots-française.md     ← uses French dictionary (no errors)
└── mots-française.err    ← uses English dictionary (French words flagged)
```

## See Also

- [Use Dictionaries from `cspell-dicts`](use-dictionaries-from-cspell-dicts.md)
- [Use an Extra Dictionary Based on the Folder or Filename](file-or-folder-based-overrides.md)
- [Setup pre-commit Hook](../README.md#setup-pre-commit-hook)
