# Scripts overview

Both scripts live in the [`scripts/`](../scripts/) folder. They are plain batch files, so you can open and edit them in any text editor.

## `repo_cloner.bat`

Clones repositories for the first time.

| Step | What it does |
| --- | --- |
| 1 | Prints a banner. |
| 2 | Changes to your Desktop and creates a `GitRepos` folder: `cd C:\Users\YOUR_USER\Desktop && mkdir GitRepos`. If the folder already exists, `mkdir` reports that and the script carries on. |
| 3 | For each repo, changes into `GitRepos` and runs `git clone https://github.com/REPO_OWNER/REPO_NAME.git`. |
| 4 | Prints a completion message and exits. |

**Result:** `C:\Users\<you>\Desktop\GitRepos\<repo>` for every repo listed.

## `repo_updater.bat`

Brings existing clones up to date.

| Step | What it does |
| --- | --- |
| 1 | Prints a banner. |
| 2 | For each repo, changes into the repo's folder and runs `git pull`. |
| 3 | Prints a completion message and exits. |

> **Check the path.** The updater must point at the folder the cloner created. The cloner puts repos in `Desktop\GitRepos\REPO_NAME`, so the updater's `cd` should read:
>
> ```bat
> cd C:\Users\YOUR_USER\Desktop\GitRepos\REPO_NAME && git pull
> ```

## Anatomy of a repo section

Each repo is handled by a small, self-contained section of six lines. This is the block you copy when you want to add another repo (see [Adding multiple repos](CONFIGURATION.md#adding-multiple-repos)).

**In `repo_cloner.bat`:**

```bat
echo Cloning REPO_NAME ...
cd C:\Users\YOUR_USER\Desktop\GitRepos && git clone https://github.com/REPO_OWNER/REPO_NAME.git
timeout /t 1 >nul
echo:
echo ______________________________________________________________________________
echo:
```

**In `repo_updater.bat`:**

```bat
echo Updating REPO_NAME ...
cd C:\Users\YOUR_USER\Desktop\GitRepos\REPO_NAME && git pull
timeout /t 1 >nul
echo:
echo ______________________________________________________________________________
echo:
```

The `echo` lines only print progress messages and the `timeout` gives you a moment to read them. The `cd ... && git ...` line does the real work.

[Back to the README](../README.md)
