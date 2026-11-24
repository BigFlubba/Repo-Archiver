# Repo Archiver

Two small Windows batch scripts for keeping local copies of GitHub repositories:

- **`repo_cloner.bat`** clones one or more repos into a `GitRepos` folder on your Desktop.
- **`repo_updater.bat`** pulls the latest changes for the repos you've already cloned.

Handy for archiving projects you don't want to lose, or for keeping a set of repos current with one double-click.

## Requirements

- Windows
- [Git for Windows](https://git-scm.com/download/win), installed and available on your `PATH`

## Quick start

1. **Clone this repo** so you get the scripts and all of the docs. Open Command Prompt in the folder where you want to keep it and run:

   ```bat
   git clone https://github.com/BigFlubba/Repo-Archiver.git
   ```

   The scripts are in the `scripts` folder of the clone.

2. **Edit `scripts\repo_cloner.bat`** in a text editor (Notepad is fine) and replace the placeholders:

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

4. **Edit `scripts\repo_updater.bat`** the same way (`YOUR_USER` and `REPO_NAME`). Make sure its path points at the folder the cloner created, which is inside `GitRepos`:

   ```bat
   cd C:\Users\Alex\Desktop\GitRepos\Repo-Archiver && git pull
   ```

5. **Run `repo_updater.bat`** whenever you want to pull the latest changes, or [schedule it to run automatically](docs/SCHEDULING.md).

> Not sure what your user folder is called? Open `C:\Users\` in File Explorer. It's the folder with your name on it.

## Documentation

| Guide | What's in it |
| --- | --- |
| [Scripts overview](docs/SCRIPTS.md) | What each script does, line by line |
| [Configuration](docs/CONFIGURATION.md) | Placeholders, running on a different drive (`cd /D`), and adding multiple repos |
| [Scheduling](docs/SCHEDULING.md) | Running the updater automatically with Windows Task Scheduler |
| [Troubleshooting](docs/TROUBLESHOOTING.md) | Common errors and fixes |

## Common tasks

- **Archive more than one repo?** See [Adding multiple repos](docs/CONFIGURATION.md#adding-multiple-repos).
- **Repos live on a drive other than `C:`?** See [Using a different drive](docs/CONFIGURATION.md#using-a-different-drive).
- **Want updates to run on their own?** See [Scheduling with Task Scheduler](docs/SCHEDULING.md).

## License

Released into the public domain. See [LICENSE](LICENSE).