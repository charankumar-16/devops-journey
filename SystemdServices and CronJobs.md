# Systemd Services

  - When the machine boot the Systemd is the first process to start and it launches everything else Network, SSH, CRON, etc...
  - **Service**:  Any process that runs for longer duration is a service. Every Service is managed by the Systemd
  - Every service is written as unit file in the **/etc/systemd/system**

  - Two different types of commands exist here:
    
      - systemctl: To manage the units / services
      - journalctl: To read the logs of the service

  ## systemctl 

  - systemctl [command] [service_name]
    
  **Life cycle commands:**
  
      - systemctl status service. [ what's going on with the service]
      - systemctl start service. [start the service now ]
      - systemctl stop service. [stop the service now]
      - systemctl restart service. [stop then start {some downtime}]
      - systemctl reload service. [re-read the config files{no downtime} , This works only if the service support] 
   
    Two Main Keywords:
      - enabled: will the service auto start when the machine boots ?
      - active: Is service is running right now ?

       systemctl enable service  {auto start on reboot}
       systemctl disable service  {don't start on next boot}
       systemctl enable --now service {auto start and start immediately}
       systemctl disable --now service {disable and stop immediately }

  **Listing the Services :**

    - systemctl list-units --type=service
    - systemctl list-units --type=service --state=failed

  *Note: When we change or add the unit file. systemd doesn't notice on its own.*
  
     - sudo systemctl daemon-reload
     - systemctl enable --now service

  ## journalctl

    - This Capture all the Normal Outputs and the Error messages that a service prints 
    
    - journalctl -U ssh 
    - journalctl -U ssh --since today

    
# Crontab
  - Main Purpose of Crontab is a Linux Scheduler. where It runs a shell script based on the schedule.
  - /etc/crontab : This is the place where we define the schedule for the file we want to run.
  - Cron schedule would look like this: * * * * *  file_path.
  - Each star(*) would represent these in the same order as above second, minute, hour, day, month.
  - To edit the crontab file we have separate command.
    
        - crontab -e [opens the crontab file]
        - crontab -l [list your current crontab]
        - crontab -r [removes the entire crontab]

- Crontab runs with a base environment. So, the script might run fine in the terminal but might not run with crontab because of this base environment.
- In this environment, crontab doesn't load the shell setup: no `.bashrc`, no `.profile`, and a very short `PATH=/usr/bin:/bin`.

- Most tools like Docker, Python, AWS, and Node would live in `/usr/local/bin/`. So, the cron may not identify these if we use the short command and might throw an error.

To make the shell script run perfectly:

- Use the full path of the tools (or)
- Set the `PATH` variable on the first line of the crontab:
    - PATH=/usr/bin:/bin:/usr/local/bin
 
- We have different folders in the crontab according to our purpose:
     - want to run the script once in a hour then use this /etc/cron.hourly
     - similarly for daily, weekly, monthly etc.
- There is nothing to reload anything whenever you crontab. The system automatically updates everything.
 
- Modern Practice is to leave the /etc/crontab file empty and use the /etc/cron.d for the fully customized schedule

## Systemd Timers
- The main issue with the crontab is, we cannot track the logs of these files. To solve this issue, we have SystemdTimers.
- In SystemdTimers we write the cronjob as a service and each service have the systemdTimer.
- If there exists a backup cronjob. How do we write in the SystemdTimer

      - /etc/systemd/system/backup.service [This contains which script to run]
      - /etc/systemd/system/backup.timer [This contains the schedule when to run the above script]
      - After writing the two files, we need to reload the systemd and enable the timer . so that the system would there exists these two files:
          - systemctl daemon-reload
          - systemctl enable --now backup.timer




       
  


    
    
  
       

       
    
    
 



