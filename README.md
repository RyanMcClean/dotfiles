# Configuration Files

My custom config files and rcs.

Now includes duckdns scripts, scripts for yt-dlp, and some env variables. (Requires a user defined .env file)

This script now will also copy ssh-keys to servers defined in the .env file.
For this the script will check if the ssh-key already exists, before copying,
this saves time when the ssh-key is copied already, but if the server is unreachable
then it can take a bit longer

## Installation

Inside the repository you can run `install` to place the configs in `~`.
This will symlink them from the repository, so you can easily update with `git
pull`.
