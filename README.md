# Dotfiles Ansible Playbook
## Overview
This repository contains an Ansible playbook for automating the setup of dotfiles. It creates symbolic links from a central directory (~/.dotfiles) to their respective locations in the user's home directory.

## Prerequisites
Ansible: Ensure Ansible is installed on your system.

## Clone the repository
```bash
git clone git@github.com:vfaergestad/.dotfiles.git <path/to/your/dotfiles>
```

## Running the Playbook
To execute the playbook, navigate to the directory containing the playbook and run:
```bash
ansible-playbook dotfiles.yml
```

## Customizing the Playbook
To customize the playbook for your dotfiles, modify the dotfiles variable in the vars section of the playbook. Specify each file's source (src) and destination (dest) as follows:

```yaml
dotfiles_dir: ~/.dotfiles # Change this if you want to use a different directory for your dotfiles
dotfiles:
  - src: .zshrc
    dest: ~/.zshrc
  - src: .vimrc
    dest: ~/.vimrc
  # Add more dotfiles as needed
```