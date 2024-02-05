services that run in the background without user interaction DAEMON

sudo systemctl start ssh # this 
sudo systemctl status ssh # checks the status of the service
sudo systemctl enable ssh # run ssh at startup

ps -aux | grep ssh # at startup run this command to make sure the process started on boot
systemctl list-units --type=service # this will list all services
journalctl -u ssh.service --no-pager # we can see services that failed to start for a reason

## Killa  process ####################################
Running
Waiting (waiting for an event or system resource)
Stopped
Zombie (stopped but still has an entry in the process table).

kill -l # view all signals you can send to kill a service
    1	SIGHUP - This is sent to a process when the terminal that controls it is closed.
    2	SIGINT - Sent when a user presses [Ctrl] + C in the controlling terminal to interrupt a process.
    3	SIGQUIT - Sent when a user presses [Ctrl] + D to quit.
    9	SIGKILL - Immediately kill a process with no clean-up operations.
    15	SIGTERM - Program termination.
    19	SIGSTOP - Stop the program. It cannot be handled anymore.
    20	SIGTSTP - Sent when a user presses [Ctrl] + Z to request for a service to suspend. The user can handle it afterward.
kill 9 <PID> # this would kill program by PID number 
[CTRL + z] # this will send process to the background
jobs # this will show all your background processes
bg # backgrounds a process
fg 1 # make forgaround process

### Execute multiple commands ####################################
echo '1'; echo '2'; echo '3' # this is the command seperator
echo '1'; ls MISSING_FILE; echo '3' # sing the && will run commands one after another. Erros break the execution stream

systemctl list-units --type=service --all --no-pager --no-legend --query='name,description'
systemctl list-units: This command is used to list units (services, sockets, devices, etc.) in the system.
--type=service: Specifies that you want to list services specifically.
--all: Displays all units, including inactive ones.
--no-pager: Prevents the output from being piped into a pager like less, ensuring it is displayed in the terminal.
--no-legend: Removes the legend/header line from the output.
--query='name,description': Specifies the fields you want to display in the output, in this case, the service name and description.



