# Configuration

## Placeholders

The scripts ship with placeholders that you need to replace before running them.

| Placeholder | Used in | Replace with |
| --- | --- | --- |
| `YOUR_USER` | Both scripts | Your Windows user folder name (see `C:\Users\`) |
| `REPO_OWNER` | `repo_cloner.bat` | The GitHub user or organisation that owns the repo |
| `REPO_NAME` | Both scripts | The repository name |

The clone URL is built from the owner and name, so `REPO_OWNER` = `BigFlubba` and `REPO_NAME` = `Repo-Archiver` gives:

```
https://github.com/BigFlubba/Repo-Archiver.git
```

The easiest way to change them is your editor's **Find & Replace**. In Notepad, press `Ctrl+H`.

## Using a different drive

By default, the scripts assume everything is on the `C:` drive. In Windows, a plain `cd` can't switch drives. If you run `cd D:\GitRepos` while you're on `C:`, the command appears to succeed, but you stay on `C:`, and Git then runs in the wrong place.

**To run the scripts on a different drive than the repo folders, add `/D` to the `cd` commands.** The `/D` switch tells `cd` to change the current drive as well as the folder.

```bat
:: Without /D (stays on the current drive)
cd D:\GitRepos\Repo-Archiver && git pull

:: With /D (switches to D: first)
cd /D D:\GitRepos\Repo-Archiver && git pull
```

Do this for **every** `cd` line in the script, including the one that creates the folder in the cloner:

```bat
cd /D D:\Archive && mkdir GitRepos
cd /D D:\Archive\GitRepos && git clone https://github.com/BigFlubba/Repo-Archiver.git
```

If the scripts and the repos are on the same drive, `/D` is harmless, so adding it everywhere is always safe.

## Adding multiple repos

Each repo has its own self-contained section in the script. To handle more than one repo, **copy and paste that section** once per repo and edit the pasted copy.

### Cloner

1. Open `repo_cloner.bat`.
2. Find the cloning section: the six lines starting at `echo Cloning REPO_NAME ...`:

   ```bat
   echo Cloning REPO_NAME ...
   cd C:\Users\YOUR_USER\Desktop\GitRepos && git clone https://github.com/REPO_OWNER/REPO_NAME.git
   timeout /t 1 >nul
   echo:
   echo ______________________________________________________________________________
   echo:
   ```

3. Copy it and paste it directly underneath, before the "Repo(s) cloned!" footer.
4. In each pasted copy, change `REPO_NAME` (twice) and `REPO_OWNER` to the next repo.

Example with two repos:

```bat
echo Cloning Repo-Archiver ...
cd C:\Users\Alex\Desktop\GitRepos && git clone https://github.com/BigFlubba/Repo-Archiver.git
timeout /t 1 >nul
echo:
echo ______________________________________________________________________________
echo:

echo Cloning Some-Other-Repo ...
cd C:\Users\Alex\Desktop\GitRepos && git clone https://github.com/SomeOwner/Some-Other-Repo.git
timeout /t 1 >nul
echo:
echo ______________________________________________________________________________
echo:
```

### Updater

1. Open `repo_updater.bat`.
2. Find the updating section: the six lines starting at `echo Updating REPO_NAME ...`:

   ```bat
   echo Updating REPO_NAME ...
   cd C:\Users\YOUR_USER\Desktop\GitRepos\REPO_NAME && git pull
   timeout /t 1 >nul
   echo:
   echo ______________________________________________________________________________
   echo:
   ```

3. Copy it and paste it directly underneath, before the "Repo(s) updated!" footer.
4. In each pasted copy, change `REPO_NAME` (twice) to the next repo's folder name.

Example with two repos:

```bat
echo Updating Repo-Archiver ...
cd C:\Users\Alex\Desktop\GitRepos\Repo-Archiver && git pull
timeout /t 1 >nul
echo:
echo ______________________________________________________________________________
echo:

echo Updating Some-Other-Repo ...
cd C:\Users\Alex\Desktop\GitRepos\Some-Other-Repo && git pull
timeout /t 1 >nul
echo:
echo ______________________________________________________________________________
echo:
```

Keep the two scripts in sync: every repo you add to the cloner should also get a section in the updater.

[Back to the README](../README.md)
