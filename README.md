# bookmyshow-database-assignment
BookMyShow Database Assignment
Objective
Design a normalized MySQL database for a movie-ticketing platform similar to the BookMyShow theatre/show listing shown in the assignment.
The database stores:
- Theatres
- Screens inside theatres
- Movies
- Movie formats such as 2D and 3D
- Individual movie shows with date and time
Files
- bookmyshow.sql - Complete executable MySQL script containing database creation, tables, sample data and the P2 query.
- BookMyShow_Database_Assignment.docx - Complete assignment document with entities, attributes, relationships, normalization explanation, sample rows and SQL.
How to run
1. Open MySQL Workbench or another MySQL 8.x client.
2. Open bookmyshow.sql.
3. Execute the complete script.
4. The script creates the bookmyshow_db database.
5. The P2 query returns all shows for PVR: Nexus on 25 April 2026.
P2 Query
The query joins shows, movies, screens, theatres and formats, filters by theatre and date, and sorts the results by show time.
Normalization
The design follows 1NF, 2NF, 3NF and BCNF:
- Atomic values are stored in every column.
- Repeating show timings are represented as separate rows.
- Movie, theatre, screen and format details are separated into their own tables.
- Non-key attributes depend on the key of their own table.
- Primary keys and unique constraints ensure the relevant determinants are candidate keys.
Assumptions
1. A theatre can contain multiple screens.
2. A screen can host multiple shows on different dates/times.
3. A screen cannot have two shows at the exact same date and time.
4. A movie can have multiple shows.
5. A show belongs to one movie, one screen and one format.
