# Linux 

## File Paths:

- /etc/passwd --> Dictionary of all the accounts in the system. The first entires says the accounts related to the system and last entries are                    done by the user
- /etc/systemd/system/ --> All the unit files for the local service are present here
- /var/log/journal --> a Binary log file. journalctl parses while displaying.





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
    - \* -> Matches any number of charactes{includes 0}
    - ? -> Matches exactly one character.

## Searching:

- **grep** : This is to search for the text in the file 
  
  - grep pattern file_path
    - **-i** flag is to ignore the case of the pattern
    - **-v** flag is used to print the lines that doesn't match the pattern
    - **-c** flag is used to count the number of lines match the pattern
    - **-n** flag Prints the line number along with the line.
 
  - Searching recursively for a pattern in each file of folder using grep:
    - 1) grep -r pattern folder 
    - Narrowing the space :
      - **grep -r -l pattern folde**r: This prints the file names
      - **grep -r --include="*.log" pattern folder**: The search space only includes files ending with .log inside the folder.

- **find** : This is to locate the file in the system [**Wildcards work but you must quote them.**]
  - find "path" {Conditions}
    - **Conditions :**
       1. -name 'pattern' - filename (case-sensitive). 
       2. -iname 'pattern' - filename (case-insensitive).
       3. -type f - regular files only.
       4. -type d - directories only.
 






































