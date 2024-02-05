Tools that can be used for backup
1. Rsync
    - good for large data, only changed parts of the file
2. Deja Dup
3. Duplicity
    - comprehensive data protection and secure backups
    -can encrypte backup copies
backups can be encrypted using;
    1. GnuPG
    2. eCryptfs
    3. LUKS

sudo apt install rsync -y # install HTB
rsync -av <dir to copy> user@backup_server:<remote file location>
    # -a preserver the original file attributes
    # -v verbose, additional detailed output
rsync -av /path/to/mydirectory user@backup_server:/path/to/backup/directory

#### BACKUP ND RESTORE ###################
rsync -avz --backup --backup-dir=/path/to/backup/folder --delete /path/to/mydirectory user@backup_server:/path/to/backup/directory
    # -z enabled compression
    # --backup creates incremental backups in the directory /path/to/backup/folder
    # --delete option removes files from the remote
rsync -av user@remote_host:/path/to/backup/directory /path/to/mydirectory

#### Secure transfer of our backup ########################
rsync -avz -e ssh /path/to/mydirectory user@backup_server:/path/to/backup/directory

#### Auto syncronization ###############
1. create a new script called RSYNC_Backup.sh
----------------------------------------------------
#!/bin/bash
rsync -avz -e ssh /path/to/mydirectory user@backup_server:/path/to/backup/directory
----------------------------------------------------
2. now make sure proper permissions area applied
chmod +x RSYNC_Backup.sh
3. create a crontba to run the script every hhour at the 0 minuite 
0 * * * * /path/to/RSYNC_Backup.sh


