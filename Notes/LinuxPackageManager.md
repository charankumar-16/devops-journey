# Debian or apt Package Manager 
  - dpkg -> debian package
  - apt -> advanced package tool
  - repository ->  It is just a URL where packages live [Ubuntu ships with the official Ubuntu repos already configured]

  **sudo apt update:**
  
      -  It downloaded the index (the catalog) from the repositories listed in /etc/apt/sources.list (or /etc/apt/sources.list.d/). 
          The index records, for each package, its version, its dependencies, and which file to download.
      - It does Install any packages. It just update the catlog/index of packages

  **sudo apt install -y pkg1 pkg2**

     - Before running this command always run  sudo apt update.
     - If you skip sudo apt update and go straight to sudo apt install htop, your computer uses its old, outdated catalog to ask the remote     
       server for the htop package. If the server has recently replaced that version of htop with a newer one, the server will reply with a
       "404 Not Found" error because the old file doesn't exist anymore.

  **sudo apt upgrade**

    - This updates the packages installed in the system accordingly with the catalog we have

  **Delete a Package is done in 3 Levels**:

    - sudo apt remove pkg1 [Remove the pkg1 and keep its config files ]
    - sudo apt purge pkg1  [Remove the pkg1 and its config files ]
    - sudo apt autoremove [cleanup unused dependencies ]


  **dpkg[To know about the installed packages in the system]**

    - dpkg -l 
    - dpkg -L package_name [which files a packages installed]
    - dpkg -S file_path [To which package this file belongs to ]
