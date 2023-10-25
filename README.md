# Installation

Clone this repo: `git clone https://github.com/jenigamracy/dotfiles.git`

Go to the directory: `cd dotfiles`

Run the script: `./setup.sh`
- This will do the following:
    - create symlinks in your home directory to .vimrc and .vim directory (for backup purposes)
    - copy the .bash\* files if they don't already exist in the home directory; otherwise append to them

# Troubleshooting

- Unable to symlink in git-bash on Windows
    - Run git-bash as admin
    - `export MSYS=winsymlinks:nativestrict`

- Failed to push some refs
    - `git config --global push.autoSetupRemote true`
