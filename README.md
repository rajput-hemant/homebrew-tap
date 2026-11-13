# Homebrew tap

Formulae for [rajput-hemant](https://github.com/rajput-hemant)'s tools.

```sh
brew tap rajput-hemant/tap
brew install <formula>
```

Or in one step, without tapping first:

```sh
brew install rajput-hemant/tap/<formula>
```

## Formulae

| Formula | Description | Install |
| --- | --- | --- |
| `dman` | Terminal-first download manager built on aria2 (optional yt-dlp for video) | `brew install rajput-hemant/tap/dman` |

## How formulae get here

Every formula is a file in `Formula/<name>.rb`, so this tap holds any number of
packages and is not tied to one project. Formula files are written by each project's
release workflow (cargo-dist's Homebrew publisher pushes `Formula/<name>.rb` with a
token that has write access to this repo), or added by hand in a pull request.

`brew audit --strict --online Formula/<name>.rb` checks a formula before it lands.
