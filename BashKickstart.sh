#!/bin/bash
# BashExecutor

# Declare colors
C_NOC='\033[0m'
C_RED='\033[0;31m'
C_ORG='\033[0;33m'

# Get Script folder
DIR=$1

# Header
echo "●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●"
echo -e "             ${C_ORG}Bash Kickstart${C_NOC}"
echo "●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●"
echo ""
printf "${C_ORG}$DIR\n"

# Change to Script folder
cd "$DIR"

# Initialize Folder-Level
lev=1

# Initialize Folder-Step
stp=3

# Initialize Executable-Number
num=0

# Declare array of executables
declare -a exec

# Function for output of folders
list_dir () {

    # Local storage for current file
    local f_tmp

    # Loop over directory
    for f in $1
    do

        # Print level spacing
        tabs $lev

        # If f is directory
        if [ -d $f ] ;
        then
            # Show as directory
            printf "\t${C_ORG}└─(${f##*/})\n"

            # Increase level
            lev=$((lev+stp))

            # Loop through subdirectory
            f_tmp=$f
            list_exe "$f_tmp/*"
            list_dir "$f_tmp/*"

            # Decrease level
            lev=$((lev-stp))

        fi

    done

}

# Function for output of folders
list_exe () {

    # Loop over directory
    for f in $1.sh
    do

        # Print level spacing
        tabs $lev

        # Increase executable number
        num=$((num+1))

        # Show executable
        printf "\t${C_RED}└─\e[4m%03d\e[24m ${f##*/}\n" $num

        # Add to list of executables
        exec+=("$f")

    done

}

# Execute folder listing
list_exe "*"
list_dir "*"

# Return to no color and new Line
printf "\n${C_NOC}●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●\n\n"


# Input prompt
printf "Execute file: "

# Get Input
read script

# Check input
if (( script > 0 && script <= ${#exec[@]} )) ;
then

    # convert to zero based
    script=$((script-1))

    # Input prompt
    printf "\nExecuting: ${exec[$script]} ...\n\n"

    printf "●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●\n\n"

    # Execute Script
    bash ${exec[$script]}

else

    printf "\nNo valid number. ENTER to close ...\n\n"
    read

fi
