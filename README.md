# Repo Archiver

Two small Windows batch scripts for keeping local copies of GitHub repositories:

- **`repo_cloner.bat`** clones one or more repos into a `GitRepos` folder on your Desktop.
- **`repo_updater.bat`** pulls the latest changes for the repos you've already cloned.

Handy for archiving projects you don't want to lose, or for keeping a set of repos current with one double-click.

## Requirements

- Windows
- [Git for Windows](https://git-scm.com/download/win), installed and available on your `PATH`

## Quick start

1. **Download the scripts.** Grab `repo_cloner.bat` and `repo_updater.bat` from the [`scripts/`](scripts/) folder.

2. **Edit `repo_cloner.bat`** in a text editor (Notepad is fine) and replace the placeholders:

   | Find | Replace with | Example |
   | --- | --- | --- |
   | `YOUR_USER` | Your Windows user folder name | `Alex` |
   | `REPO_OWNER` | The GitHub user or organisation that owns the repo | `BigFlubba` |
   | `REPO_NAME` | The name of the repo | `Repo-Archiver` |

   There are three places to change, so use **Find & Replace**. Here's what the relevant lines look like before and after:

   ```bat
   :: Before
   cd C:\Users\YOUR_USER\Desktop && mkdir GitRepos
   cd C:\Users\YOUR_USER\Desktop\GitRepos && git clone https://github.com/REPO_OWNER/REPO_NAME.git

   :: After
   cd C:\Users\Alex\Desktop && mkdir GitRepos
   cd C:\Users\Alex\Desktop\GitRepos && git clone https://github.com/BigFlubba/Repo-Archiver.git
   ```

3. **Run `repo_cloner.bat`** by double-clicking it. Your repo is cloned to `C:\Users\<you>\Desktop\GitRepos\<repo>`.

4. **Edit `repo_updater.bat`** the same way (`YOUR_USER` and `REPO_NAME`). Make sure its path points at the folder the cloner created, which is inside `GitRepos`:

   ```bat
   cd C:\Users\Alex\Desktop\GitRepos\Repo-Archiver && git pull
   ```

5. **Run `repo_updater.bat`** whenever you want to pull the latest changes.

> Not sure what your user folder is called? Open `C:\Users\` in File Explorer. It's the folder with your name on it.

## Documentation

| Guide | What's in it |
| --- | --- |
| [Scripts overview](docs/scripts.md) | What each script does, line by line |
| [Configuration](docs/configuration.md) | Placeholders, running on a different drive (`cd /D`), and adding multiple repos |
| [Troubleshooting](docs/troubleshooting.md) | Common errors and fixes |

## Common tasks

- **Archive more than one repo?** See [Adding multiple repos](docs/configuration.md#adding-multiple-repos).
- **Repos live on a drive other than `C:`?** See [Using a different drive](docs/configuration.md#using-a-different-drive).

## License

Released into the public domain. See [LICENSE](LICENSE).
