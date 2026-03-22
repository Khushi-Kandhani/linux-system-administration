1. chmod — Change File Permissions

# Permission number = sum of: r=4, w=2, x=1
chmod 777 file.sh     # rwxrwxrwx — everyone full access (dangerous!)
chmod 755 file.sh     # rwxr-xr-x — owner:full, group+others:read+execute
chmod 644 file.txt    # rw-r--r-- — owner:read+write, group+others:read only
chmod 600 secret.txt  # rw------- — owner:read+write only, nobody else
chmod 400 key.pem     # r-------- — owner:read only (SSH key standard)
chmod 000 file.txt    # --------- — nobody can do anything

# Directories typically:
chmod 755 /var/www/html    # Standard for web directories
chmod 700 /home/user/      # Private home directory

Symbolic Mode — More Readable

# Syntax: [who][operator][permission]
# who:      u=user(owner)  g=group  o=others  a=all
# operator: +=add  -=remove  ==set exactly

chmod +x script.sh         # Add execute for everyone
chmod -x script.sh         # Remove execute for everyone
chmod u+x script.sh        # Add execute for owner only
chmod g+w file.txt         # Add write for group
chmod o-r file.txt         # Remove read from others
chmod a+r file.txt         # Add read for all
chmod u+x,g-w file.txt     # Multiple changes at once
chmod go-rwx secret.txt    # Remove all perms from group and others
chmod u=rwx,go=rx file.sh  # Set exact permissions per group

2. chown — Change Ownership

chown john file.txt              # Change owner to john
chown john:devs file.txt         # Change owner + group
chown :devs file.txt             # Change group only
chown -R john:devs /var/www/     # Recursively change owner + group

# Real-world usage:
chown -R www-data:www-data /var/www/html/   # Web server ownership
chown root:root /etc/passwd                  # System file ownership
chown deploy:deploy /opt/app/               # App deployment ownership
