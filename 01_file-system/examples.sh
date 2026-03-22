#!/bin/bash
# Linux Permissions and File Search Demo
# example.sh

echo "===== Filesystem & Permissions Demo ====="

# Create demo folder and files
mkdir -p demo_folder
cd demo_folder || exit

touch file.txt script.sh log1.log log2.log temp.tmp
echo "Demo content" > file.txt

echo "Initial file listing:"
ls -l

# ==========================
# Permissions examples
# ==========================
echo -e "\n--- Changing Permissions ---"
chmod 755 script.sh       # rwxr-xr-x
chmod 644 file.txt        # rw-r--r--
chmod +x script.sh        # add execute to everyone
chmod -x script.sh        # remove execute
chmod u+x script.sh       # add execute for owner only
chmod go-w file.txt       # remove write for group/others
chmod -R 755 .            # recursively apply to folder

ls -l

# ==========================
# Ownership examples
# ==========================
echo -e "\n--- Changing Ownership ---"
# Note: change user/group names according to your system
# chown youruser file.txt
# chown youruser:yourgroup file.txt
# chown -R youruser:yourgroup . 
# (Commented out to avoid permission errors on others' systems)

# ==========================
# Find command examples
# ==========================
echo -e "\n--- Using Find Command ---"
echo "Find all files named file.txt from current directory:"
find . -name "file.txt"

echo "Find all .log files in current directory:"
find . -name "*.log"

echo "Find only files with .sh extension in current folder:"
find . -type f -name "*.sh"

echo "Find only directories named logs:"
find . -type d -name "logs"

echo "Find files larger than 100MB (example, may show nothing):"
find . -size +100M

echo "Find files modified in last 7 days:"
find . -mtime -7

echo "Find files NOT modified in last 30 days:"
find . -mtime +30

echo "Find empty files and directories:"
find . -empty

echo "Find files with permissions 777:"
find . -perm 777

echo "Find files owned by user 'john' (replace with your user):"
find /home -user john

# ==========================
# Find + execute examples
# ==========================
echo -e "\n--- Find + Execute ---"
echo "Find all .tmp files and delete them (demo, keep commented):"
# find . -name "*.tmp" -exec rm {} \;

echo "Find all .log files and show size:"
find . -name "*.log" -exec ls -lh {} \;

echo -e "\n===== Demo Completed ====="

# Go back to previous directory
cd ..
