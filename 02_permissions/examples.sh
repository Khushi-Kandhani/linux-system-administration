#!/bin/bash
# examples.sh - Real-life Linux Permissions Examples

echo "===== Starting Permissions Examples ====="

# 1. Create sample files and folders
touch file1.txt file2.txt
mkdir project_folder

echo "Sample files and folder created"
ls -l

# 2. Change file permissions
echo "Changing file1.txt permissions to 744 (owner rwx, others read)"
chmod 744 file1.txt
ls -l file1.txt

# 3. Add execute permission to a script
echo "Creating script.sh and adding execute permission for owner"
echo -e "#!/bin/bash\necho Hello World" > script.sh
chmod u+x script.sh
ls -l script.sh

# 4. Remove write permission from group and others
echo "Removing write permission from file2.txt for group and others"
chmod go-w file2.txt
ls -l file2.txt

# 5. Change ownership (if run as sudo)
echo "Changing owner of file1.txt to current user and group to developers (if exists)"
# sudo chown $USER:developers file1.txt
echo "Skipped actual chown if not sudo"

# 6. Special permissions demo
echo "Setting SUID on script.sh"
chmod 4755 script.sh
ls -l script.sh

# 7. Sticky bit example in folder
echo "Setting sticky bit on project_folder"
chmod 1777 project_folder
ls -ld project_folder

# 8. Recursive permissions
echo "Changing all files in project_folder to 755 recursively"
chmod -R 755 project_folder
ls -l project_folder

# 9. Viewing permissions in human-readable format
echo "Viewing detailed permissions using stat"
stat file1.txt

echo "===== Permissions Examples Complete ====="
