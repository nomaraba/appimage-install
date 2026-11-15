# appimage-install

Installs AppImage files as desktop applications and keeps them updated.
It moves the file to `~/App`, links a command into `~/.local/bin`, extracts
the icon, writes a `.desktop` entry, and refreshes the desktop caches.
Every install is recorded in `~/App/apps.json`, so `update` can compare
your version against the upstream releases later.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/nomaraba/appimage-install/main/setup.sh | sh
```

## Usage

```bash
appimage-install <file-or-url> [options]
appimage-install update [name] [--yes]
appimage-install docs
```

## Install options

### `<file-or-url>`

Path to a local `.AppImage`, or a direct download URL. A GitHub
releases asset URL also becomes the update provider, so a later
`update` knows where to look for newer builds.

### `--name NAME`

Display name in the application menu, and the command name in
`~/.local/bin`. Default: the name written inside the AppImage.

### `--desc TEXT`

Comment written to the `.desktop` file. Some launchers show it
under the app name. Default: the comment inside the AppImage,
or the app name if it has none.

### `--dest DIR`

Install directory. Default: `~/App/<name>`.

### `--keep`

Copy the file instead of moving it.

### `--version V`

Record this version when the filename contains none. The updater
needs a version to know what "newer" means.

### `--probe-version`

Run `<appimage> --version` and read the version from its output.
Only needed when the filename has none and `--version` was not
given. It starts the app once, so a window may appear briefly.

### `--update-link URL`

Track updates against this GitHub releases URL. Accepted forms:
an asset download URL, or the releases page of a repository.

## Update

### `update`

Check every tracked app for a newer release. Newer candidates
are listed as a numbered menu. Type a number to install, or
press Enter to cancel.

### `update [name]`

Check one app.

### `--yes`

Install the newest release without asking.

Version comparison reads the numbers only: 1.15.2 counts as newer
than 1.15.1, and a suffix such as `-alpha-1-20251018` is compared as
its own number. Releases marked prerelease on GitHub are skipped.
The updater picks the asset built for this machine's architecture
and accepts archless asset names as a fallback. Unauthenticated
GitHub API calls are limited to 60 per hour.

## Files

| Path                       | Purpose           |
| -------------------------- | ----------------- |
| `~/App/<name>/`            | installed AppImage |
| `~/App/apps.json`          | install record    |
| `~/.local/bin/<cmd>`       | command symlink   |
| `~/.local/share/applications/` | .desktop entries |
| `~/.local/share/icons/hicolor/` | extracted icons |

To remove an app, delete its directory under `~/App`, the symlink in
`~/.local/bin`, the `.desktop` file, the icon, and its entry in
`apps.json`.

## Author

Kasaki Nomaraba
<https://github.com/nomaraba>
