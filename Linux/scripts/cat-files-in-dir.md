```Shell
#!/bin/sh
dir="$1"
suf="$2"
PAGER="${PAGER:-cat}"
test -d "$dir" || exit 1
find "$dir" -type f -name "*$suf" -exec "$PAGER" {} \;
```

This will take the first command line argument and assign it to the variable dir. The variable PAGER will be set to cat if the user hasn't already set it to something else.
If the given directory is a valid directory name, find is used to pass all regular files (including hidden regular files) in the directory, or any of its subdirectories, to the pager.
To limit the search of files to only the first level of the given directory, insert -maxdepth 1 before the -exec option to find.
Using it:
cat all files in /tmp:
$ ./script /tmp
See the first 10 lines of all files in your home directory:
$ PAGER=head ./script "$HOME"
Read all stories in your ~/stories directory:
$ PAGER=less ./script "$HOME/stories"


find prints all matching files by default if you don't specify any other action.
When you do -exec ..., it replaces the -print.
When you put two actions next to each other, it means AND.
So just do both: