# Troubleshooting

## `'git' is not recognized as an internal or external command`

Git isn't installed, or it isn't on your `PATH`. Install [Git for Windows](https://git-scm.com/download/win), then close and reopen any command prompt windows and run the script again.

## `A subdirectory or file GitRepos already exists`

This is harmless. The cloner tries to create `GitRepos` each time it runs, and the folder is already there. The script carries on.

## `destination path 'REPO_NAME' already exists and is not an empty directory`

The repo has already been cloned. Use `repo_updater.bat` to update it instead, or remove the existing folder if you want a fresh clone.

## `The system cannot find the path specified`

The path in a `cd` line doesn't exist. Check that:

- `YOUR_USER` matches a folder in `C:\Users\`.
- The updater's path includes `GitRepos` (for example `Desktop\GitRepos\REPO_NAME`).
- `REPO_NAME` is spelled exactly like the folder on disk.

## `repository '...' not found`

The URL is wrong, or the repo is private, and you aren't signed in to Git. Check `REPO_OWNER` and `REPO_NAME`, and open the URL in your browser to confirm it exists.

## Repos are on another drive, and Git runs in the wrong folder

You need `/D` on the `cd` commands. See [Using a different drive](CONFIGURATION.md#using-a-different-drive).

## A scheduled task runs but my repos don't update

Task Scheduler can report success even when `git pull` failed, because the script's last command is a `timeout`. Log the output to see what Git said. See [Checking that it worked](SCHEDULING.md#checking-that-it-worked).

## The window closes before I can read the output

Run the script from a command prompt instead of double-clicking it: open `cmd`, then drag the `.bat` file into the window and press Enter, or change the timeout from `timeout /t 1 >nul` to `timeout /t -1`.

[Back to the README](../README.md)
