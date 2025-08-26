# Linux Command Line

## ls

- `ls` most version. Doesn't show hiddens.
  - Any file that is prepended with `.` is considered a hidden file and is not listed with `ls`.
- `ls -l` list all the files and folders with their metadata
- `rw-r--r-- 1 codio codio 9451 Mar 12  2024 mini_project1.py`
  - `rw-r--r--`
    - Who can access the file or folder?
      - first char is empty for file or has `d` for dictionary
      - user (next 3 chars)
      - group (next 3 chars)
      - world (last 3 chars)
    - What can you do with the file or folder (attributes)?
      - read (r)
      - write (w)
      - execute (x)
        - for files this mean you cannot just run the file itself; think of in windows as clicking a program!
        - for dictionaries if x is not set, then you cannot go into that dictionary
    - The first three characters -- user information
- User john belongs to groups: admin and student
- User jane belongs to groups: student and volunteer
- folder has group called student?
- `chmod +x ` make the file executable
- Add a Shebang line

## Exercise

1. open a file with vim and write a simple python print statement
   1. make sure to add the Shebang line
2. close the file
3. change the execution permissions on the file -- `chmod +x`
4. run the file

0 - 1 execute
