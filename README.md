# Linux 

## File Paths:

- /etc/passwd --> Dictionary of all the accounts in the system. The first entires says the accounts related to the system and last entries are                    done by the user



## Managing Files:
- **touch** 
  - "touch /root/notes.txt" [creates the file with the respective file name]
  - If the file already exists. It modifies only the time and leave the content alone.
  
- **copy(cp)**
  - cp "file_path" "destination_path"
  - cp -r "folder_path" "destination_folder" [-r recursively copies all the files inside that folder to another folder]

- **move(mv) / rename**
  - mv file_path destination_path
  - If you want to rename the file using the mv command move the file to the same folder with a different name.
 
- **remove(rm)**
  - rm file_path1 file_path2
  - rm -r folder [deletes all the files inside this folder]
      Without -r with rm command. It didn't delete the files 
  - rm -rf folder [ -f forces the delete, even for the write-protected files ]
  - **rm -rf** is a very dangerous command.

- **globs**
  - Globs let you name many files at Once with a pattern. The shell Expands this Pattern before sending to the command.
    * -> Matches any number of charactes{includes 0}
    ? -> Matches exactly one character.

