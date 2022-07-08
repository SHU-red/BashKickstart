# :runner: BashKickstart
Bash script, giving quick access to list and execute all .sh-files of one folder and all subfolders.

Especially when you have a collection of frequently used bash-scripts in one folder (and subfolders) this can be helpful.

This shell script
1. gives a overview of folderstructure and all *.sh-files of a direcory
2. lets you then choose which one to execute
3. executes the chosen file in the already open terminal

It makes sense to start this script via system-shortcut.
For example:
```
konsole -e bash /home/user/Scripts/BashKickstart/BashKickstart.sh /home/user/Scripts
```
The script itself can be placed anywhere and the recursive search-path for *.sh-files is specified via 1st argument (as you see in the example above)

![Alt text](/README/example.gif)
