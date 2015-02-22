Move Files
==========

Ok, this is a remote attempt at the dir problem.

What I remember the problem to be;
- 2 directory sets. 2 levels deep.
- Check for large version of small file, move and rename.
- List remaining large, move and rename.
- Something about dropbox (probably want to do this locally
as remote has network issues.)
- not in git

Extension, make compare file to display both sm & lg images.

Problem may have speed issues depending on if the file is 
really moved or just rereferenced in inodes.

Backup your data first.
=======================

Have setup test directories and written script, backup your data first.

Try out on small subset of files 
eg for FILE in q; do 
then 
for FILE in {a..p} {r..z) {0..9} ; do
(remove digits as appropriate.)

may need to chmod 700 runme.sh or sudo


