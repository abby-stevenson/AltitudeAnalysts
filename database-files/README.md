# `database-files` Folder

These files run whenever the database starts 
The first file creates the database if it doesnt already exist and adds the tables to it if they dont already exist
The second file adds the data to the table 
This files will always run in this order due to the naming (the first file comes alphabetically first) 

## How to Re-bootstrap the db 
- Stop the container (either in docker desktop or by running docker stop mysql_db)
- Then remove this container (either in docker desktop or by running docker rm mysql_db)
- Then restart the container (by running docker compose up db -d)