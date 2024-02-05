Create a timer
# 1. create a directory to where the script will be stored
robby2992@htb[/htb]$ sudo mkdir /etc/systemd/system/mytimer.timer.d
robby2992@htb[/htb]$ sudo nano /etc/systemd/system/mytimer.timer
# 2 it mus contain the below information
    UNIT = description for the timer
    TIMER = spcifies when to start the timer
    INSTALL = specifices where to install the timer
-------------------------------
[Unit]
Description=My Timer

[Timer]
OnBootSec=3min
OnUnitActiveSec=1hour

[Install]
WantedBy=timers.target
-------------------------------
# Add the timer to a service
sudo nano /etc/systemd/system/mytimer.service
[Unit]
Description=My Service

[Service]
ExecStart=/full/path/to/my/script.sh

[Install]
WantedBy=multi-user.target
-------------------------------
#now eload the daemn and check to see if it works
sudo systemctl daemon-reload
sudo systemctl start mytimer.service
sudo systemctl enable mytimer.service

### CRONTAB #####################################
Time Frame	Description
Minutes (0-59)	This specifies in which minute the task should be executed.
Hours (0-23)	This specifies in which hour the task should be executed.
Days of month (1-31)	This specifies on which day of the month the task should be executed.
Months (1-12)	This specifies in which month the task should be executed.
Days of the week (0-7)	This specifies on which day of the week the task should be executed.

# System Update
* */6 * * /path/to/update_software.sh
    # Script runs every day, every 6 hours
# Execute scripts
0 0 1 * * /path/to/scripts/run_scripts.sh
    # 0 runs in the beginning of the hour/minuite
# Cleanup DB
0 0 * * 0 /path/to/scripts/clean_database.sh
# Backups
0 0 * * 7 /path/to/scripts/backup.sh


##### Systemd vs CRON ###########
System d
    1. need to create a timer, and a service script to tell the OS what to run
Cron 
    1. requires a crontab file to tell the cron daemon what to run

# display what type a service is
systemctl show -p Type syslog.service

