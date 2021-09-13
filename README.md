# cspell-cli

This repository enables using [cspell](https://github.com/streetsidesoftware/cspell) as a [pre-commit](https://pre-commit.com) hook.

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/streetsidesoftware/cspell-cli
    rev: v5.6.7
    hooks:
    - id: cspell
```

It also allows the `cspell-cli` to be installed directly from github:

```
npm install -g git+https://github.com/streetsidesoftware/cspell-cli
```

This will add the `cspell-cli` command to npm.
