#!/usr/bin/gawk -f
#
# sqlite_dot.awk
# https://github.com/TomConlin/SQLiteViz
#
# Example:
#   sqlite_dot.awk dumped_schema.sql > dumped_schema.gv
#
# The .gv file can be turned into an image with:
#   dot -Tpng dumped_schema.gv > dumped_schema.png
#
#########################################################

# symmetrically remove chars from both ends of a string
function trim(str, n){
   return substr(str, n + 1, length(str) - 2 * n)
}


BEGIN {print "digraph \"" ARGV[1] "\" {\n\trankdir = \"LR\"" }

# begin record
/^CREATE TABLE / {
    tab = tolower(trim($3, 1))
    getline
    col = tolower(trim($1, 1))
    row = tab "| <" col "> " col
}

# continue record
/^,  `/{
    col = tolower(trim($2, 1))
    row = row " | <" col "> " col
}

# foreign key makes an edge between columns
/^,  CONSTRAINT .* FOREIGN KEY/ {
    print "\t\"" tab "\":" trim($6,2) " -> \"" trim($8, 1) "\":" trim($9, 2) ";"
}

# end record, so no more columns to add.
/^);/ {print "\t\"" tab "\" [\n\t\tlabel = \"" row "\"\n\t\tshape = \"Mrecord\"\n\t];"}

# ignore for now
# /^,  PRIMARY KEY /{}
# /^,  UNIQUE/ {}
# /^CREATE INDEX /{}

END {print "}" }

