## SQLite3 schema visualization

#### Why?
    Was playing with loading mysql dumps from the web into SQLlite
    today & I did not feel like dealing with the huge (and getting huger) tool I've used
    in the past just to help make a few joins on a DB I have never seen.

### What?
    Database schemas are the discriptions of the tables, columns,
    and details of what they may contain and how they depend on one another.
    You can get a running instance of SQLite3 to show you its schema by typing
    
     .schema
        
    Staring at that schema text will give you everything you need to know make queries.
    Saving it as a file lets you scroll around and search,
    but I worry about gettting the big picture and about how long it takes to get up to speed.
    
    Turning the schema text into a picture as easily as possible is the goal.
    I tried a couple of standard tools, jumped a few install linux software hoops.
             
    No joy, always something.

    I don't really want to fight with this again but year after year I do.
    All I need is; the names of tables and columns and  
    the foreign key condtraints that let me make joins. How hard could it be?

### How?
    Not very hard at all.
    Awk translates the part of the schema we need into the GraphViz dot language
    in less than half a page of code.  
