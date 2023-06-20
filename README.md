# Slix

User space package manager based on fuse for linux.

# Typical commands
- slix run - run a single program through slix
- slix search - searching through packages
- slix sync - install/sync a package from the internet
- slix update - downloads list of available packages from mirrors/remotes
- slix script - running slix environment in a bash script
- slix archive - creates a .gar package
- slix mount - mounts a slix environment without launching any programs (used by slix shell and slix script)
- slix index - creates a list of packages (for server usage) (subcommands are init, add and info)

# Setup
If slix is not installed on your system, you can install it into your user space.
1. Download slix-bootstrap-pkg.tar.zst
2. Extract tar file by calling `tar -xaf slix-bootstrap-pkg.tar.zst`
3. Call `source slix-bootstrap-pkg/activate` for temporally activating slix environment
   or add it to your .bashrc for permanent availability


## Activating zsh/bash completion
just run `eval "$(CLICE_GENERATE_COMPLETION=$$ slix)"` and it will be available
