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

    
  



    
    
  
       

       
    
    
 



