# Scheduling the updater with Task Scheduler

You can have Windows run `repo_updater.bat` for you on a schedule, so your archived repos stay current without you lifting a finger. Windows has this built in: **Task Scheduler**.

## Before you start

- You've edited `scripts\repo_updater.bat` with your own `YOUR_USER` and `REPO_NAME` values (see the [Quick start](../README.md#quick-start)).
- You've run it by hand at least once and it pulled without errors.
- You know the full path to the script, for example `C:\Users\Alex\Desktop\Repo-Archiver\scripts\repo_updater.bat`. In File Explorer, hold `Shift`, right-click the file and choose **Copy as path**.

> **Private repos:** the scheduled task needs to be able to sign in to GitHub without asking you. If you've already pulled the repo by hand and Git saved your credentials (Git for Windows does this with Git Credential Manager), run the task as the same Windows user.

## Adding the script to a new schedule

1. Press the `Windows` key, type **Task Scheduler** and open it.
2. In the right-hand **Actions** panel, click **Create Basic Task...**.
3. **Name and description.** Enter a name such as `Repo Archiver Updater` and click **Next**.
4. **Trigger.** Choose how often to run (**Daily** or **Weekly** suit most people) and click **Next**. Set the start date, the time (pick a time your computer is usually on) and, for weekly, the days. Click **Next**.
5. **Action.** Choose **Start a program** and click **Next**.
6. **Program/script.** Click **Browse...** and select `repo_updater.bat`, or paste its full path. If the path contains spaces, wrap it in quotes:

   ```
   "C:\Users\Alex\Desktop\Repo Archiver\scripts\repo_updater.bat"
   ```

   Leave **Add arguments** and **Start in** empty. The script changes to the right folder itself.
7. **Finish.** Review the summary and click **Finish**. The task now appears in **Task Scheduler Library**.

### Recommended settings

The basic wizard uses default settings that can cause missed runs. To adjust them, double-click your task in **Task Scheduler Library** and open these tabs:

| Tab | Setting | Why |
| --- | --- | --- |
| General | **Run only when user is logged on** | Keeps the task running as you, so Git can use your saved credentials. |
| Conditions | Untick **Start the task only if the computer is on AC power** | Otherwise laptops skip the task when running on battery. |
| Settings | Tick **Run task as soon as possible after a scheduled start is missed** | If the PC was off at the scheduled time, the task runs when it next can. |

Click **OK** to save.

## Checking that it worked

Right-click the task in the library and choose **Run**. A command window opens, shows the updater's progress and closes when it's finished.

**Last Run Result** (shown in the task list) isn't a reliable check on its own. The updater's final command is a `timeout`, so the script finishes successfully even if `git pull` failed. To see what Git actually said, log the output to a file:

1. Open the task, go to the **Actions** tab, select the action and click **Edit...**.
2. Change **Program/script** to `cmd.exe`.
3. Put this in **Add arguments**, using your own paths:

   ```
   /c ""C:\Users\Alex\Desktop\Repo-Archiver\scripts\repo_updater.bat" >> "C:\Users\Alex\Desktop\updater.log" 2>&1"
   ```

4. Click **OK**.

Each run now appends its output, including any Git errors, to `updater.log`. With the output going to a file, the command window doesn't show anything.

## Using the command line instead

You can create the same task in one command with `schtasks`. Run it in Command Prompt:

```bat
schtasks /Create /TN "Repo Archiver Updater" /TR "\"C:\Users\Alex\Desktop\Repo-Archiver\scripts\repo_updater.bat\"" /SC DAILY /ST 02:00
```

| Part | Meaning |
| --- | --- |
| `/TN` | The task name |
| `/TR` | The program to run (the escaped quotes `\"` handle spaces in the path) |
| `/SC DAILY` | How often. Use `WEEKLY` with `/D SUN` for a specific day |
| `/ST 02:00` | Start time, 24-hour format |

Useful companions:

```bat
:: Run it now
schtasks /Run /TN "Repo Archiver Updater"

:: Remove it
schtasks /Delete /TN "Repo Archiver Updater" /F
```

## Changing or removing the schedule

Open **Task Scheduler**, select **Task Scheduler Library**, and find your task. Double-click it to change the trigger, action or settings. To stop the automation, right-click it and choose **Disable** (keeps it for later) or **Delete**.

## Things to keep in mind

- **Using a copy of the scripts?** Point the task at the copy you edited (see the tip in the [Quick start](../README.md#quick-start)), not the original in your clone.
- **Moved the scripts?** The task points at a fixed path. If you move or rename the repo folder, edit the task's action to match.
- **Repos on another drive?** Nothing changes in Task Scheduler, but the `cd` lines in the script need `/D`. See [Using a different drive](CONFIGURATION.md#using-a-different-drive).
- **Added more repos?** The scheduled task runs the whole script, so every repo section you've added to `repo_updater.bat` gets updated. See [Adding multiple repos](CONFIGURATION.md#adding-multiple-repos).
- **Something not working?** See [Troubleshooting](TROUBLESHOOTING.md).

[Back to the README](../README.md)
