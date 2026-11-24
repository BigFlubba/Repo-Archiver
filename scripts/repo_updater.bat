@echo off
echo ##############################################################################
echo #                                                                            #
echo #                                Repo Updater                                #
echo #                                                                            #
echo #                 https://github.com/BigFlubba/Repo-Archiver                 #
echo #                                                                            #
echo ##############################################################################
echo:
echo ------------------------------------------------------------------------------
echo:
echo Updating repo(s)!
timeout /t 1 >nul
echo ______________________________________________________________________________
echo:
echo Updating REPO_NAME ...
cd C:\Users\YOUR_USER\Desktop\REPO_NAME && git pull
timeout /t 1 >nul
echo:
echo ______________________________________________________________________________
echo:
echo ------------------------------------------------------------------------------
echo:
echo Repos updated!
echo:
echo Exiting ...
timeout /t 1 >nul
