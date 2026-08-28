# Use an Extra Dictionary Based on the Folder or Filename

<!--- cspell:ignore esac getopts shopt --->

By default, the [Bash dictionary](https://github.com/streetsidesoftware/cspell-dicts/blob/main/dictionaries/bash/cspell-ext.json) is only applied to files of type `shellscript`. This example shows how to enable the Bash dictionary for specific folders or filenames using `overrides` in your cspell configuration.

> **Note:** `pre-commit` uses the same cspell configuration, so `overrides` work identically when running cspell via `pre-commit`.

## Example: Enable the Bash Dictionary for Markdown Files

Consider a project where Markdown files contain Bash code blocks. Words like `esac`, `getopts`, and `shopt` will be flagged as unknown because the Bash dictionary is not active for `.md` files by default.

### Configuration

Add an `overrides` section to your `cspell.json`:

```json
{
  "overrides": [
    {
      "filename": ["**/bash_docs/**/*.md", "**/bash_examples/**"],
      "dictionaries": ["bash"]
    }
  ],
  "version": "0.2"
}
```

With this configuration:

- `docs/bash_docs/pipes.md` — **will** use the Bash dictionary (no errors for bash words)
- `docs/about.md` — will **not** use the Bash dictionary (bash words flagged as errors)

### Alternative: Enable the Dictionary in a Single File

For a single file, use an inline directive instead of configuring `overrides`:

```markdown
<!--- cspell:dictionaries bash --->
```

This is useful when only one or two files need the extra dictionary.

## See Also

- [Use Dictionaries from `cspell-dicts`](use-dictionaries-from-cspell-dicts.md)
- [Use a Custom Dictionary](use-a-custom-dictionary.md)
- [Setup pre-commit Hook](../README.md#setup-pre-commit-hook)
