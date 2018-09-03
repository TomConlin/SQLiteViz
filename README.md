## SQLite3 Schema Visualization

#### Why?
Was playing with loading [MySQL](https://en.wikipedia.org/wiki/MySQL)
[dumps](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html) from the web into
[SQLite](https://en.wikipedia.org/wiki/Database_dump) today and
I did not feel like dealing with the huge (and getting huger) tool I've used
in the past just to help make a few joins on a DB I have never seen.

#### What?
This may end up more specialized than I had hoped.  
Seems SQLite outputs its schema in the same 'flavor' or 'dialect' it was input.  
This worked with a mysql dump off the web translated into SQLite3 with
[mysql2sqlite](https://github.com/dumblob/mysql2sqlite).  
But I see it _not_ working with a schema dumped from other databases.  oh well.   


[Database schemas](https://en.wikipedia.org/wiki/Database_schema) are the descriptions of the tables, columns  
and details of what they may contain and how they depend on one another.  
You can get a running instance of SQLite3 to show you its schema by typing
    
     .schema
        
Staring at that text schema text will give you everything you need to know make queries.  
Saving it as a file lets you and search and scroll around,  
but I like to see the big picture and get up to speed quickly.
    
Turning the schema text into a picture as easily as possible is the goal.  
All I need is; the names of tables and columns and the foreign key constraints which let me make joins.  
How hard could it be?

#### How?
Translates the part of the schema we need into the GraphViz [dot](https://graphviz.gitlab.io/_pages/doc/info/lang.html) language,  
then view or translate it in any of the ways [GraphViz](http://graphviz.org/about/) allows.  

#### Where?
Where to next? Probably nowhere fast.  
If I run into other schema formats I need to parse I will add them.  
But these scripts have a way of working for years on end without maintenance.


I would still like to see Primary Keys , Unique columns
and Indexes represented somehow.  
Even more than that I would like to be able to cut and paste names
off of a graphical representation ... so who knows.  
Maybe this will be a side project for a while.  


### Using

Given you have an appropiatly formatted schema dumped from a SQLite database,  
here named `dumped_schema.sql` you could

    sqlite_dot.awk dumped_schema.sql > dumped_schema.gv


There is the image output from the database I wrote this against included as the file

    omia_schema.png

-----------------------------------------
    <PSA>
    Even compressed, the application I'm avoiding
    is over TEN THOUSAND times the size of this code
    not including a Java environment to run it in
    which could push it towards six orders of magnitude more ...
    </PSA>
