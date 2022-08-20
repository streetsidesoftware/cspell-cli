# Use an Extra Dictionary Based on the Folder or Filename
<!--- cspell:ignore esac getopts shopt --->

For example, using Bash dictionary with Markdown or text files, by filename (the
default is to only apply from within VSCode for files of type `shellscript`).

**Note**: This adds the Bash dictionary to the list of dictionaries against
which to check the files, it does not check only against the Bash dictionary.

This is the same for use with `pre-commit` as with other methods of invoking
`cspell`, namely configuring an `overrides` section on your `cspell.json`
or equivalent file.

The [current overrides documentation on the
website](https://cspell.org/configuration/overrides/) covers a different type of
scenario, so here is an example of selecting adding a dictionary to apply to
specific folders.

## Using Bash dictionary with Markdown or text files by filename

Given a `cspell.json` as follows:

``` json
{
  "overrides": [
      {
          "filename": ["**/bash_examples/**", "**/bash_docs/**.md"],
          "dictionaries": [
              "bash"
          ]
      }
  ],
  "version": "0.2"
}
```

Add the following code as `docs/bash_docs/a-silly-bash-code-block.md`

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

Add the following file as `examples/bash_examples/a-silly-bash-script`

``` markdown
#!/bin/bash

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

And add the following code as `docs/about.md`

```` markdown
# Just a rather eccentric bash and markdown example for documentation purposes

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

When `cspell` is invoked only `docs/about.md` should show errors.

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

