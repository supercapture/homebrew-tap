# supercapture/tap

[SuperCapture](https://supercapture.io) for Homebrew, with `scap`, its command line.

```sh
brew install --cask supercapture/tap/supercapture
```

The app updates itself, so `brew upgrade` leaves it alone (the cask says `auto_updates`). `brew uninstall --cask
supercapture` removes the app and `scap`; `--zap` also removes its settings and caches, never your library.

This folder is the source of the tap: its files live in the SuperCapture repository at `packaging/homebrew-tap/`, where
`build.sh --push` writes each release's version and checksum, and are copied to `supercapture/homebrew-tap` from there.
