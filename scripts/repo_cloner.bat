@echo off
echo ##############################################################################
echo #                                                                            #
echo #                                Repo Cloner                                 #
echo #                                                                            #
echo #                 https://github.com/BigFlubba/Repo-Archiver                 #
echo #                                                                            #
echo ##############################################################################
echo:
echo ------------------------------------------------------------------------------
echo:
echo Making directory for repo(s) ...
cd C:\Users\YOUR_USER\Desktop && mkdir GitRepos
timeout /t 1 >nul
echo:
echo Cloning repo(s)!
timeout /t 1 >nul
echo ______________________________________________________________________________
echo:
echo Cloning REPO_NAME ...
cd C:\Users\YOUR_USER\Desktop\GitRepos && git clone https://github.com/REPO_OWNER/REPO_NAME.git
timeout /t 1 >nul
echo:
echo ______________________________________________________________________________
echo:
timeout /t 1 >nul
echo:
echo ------------------------------------------------------------------------------
echo:
echo Repo(s) cloned!
echo:
echo Exiting ...
timeout /t 1 >nul
