#!/usr/bin/env fish

echo "Create .gitignore"
touch .gitignore
echo "# dotfile, with exception" >>.gitignore
echo ".*" >>.gitignore
echo "!.gitignore" >>.gitignore
echo "# python compile file" >>.gitignore
echo "*.py[co]" >>.gitignore
echo "#not track subdirectory" >>.gitignore
echo /env/ >>.gitignore
echo /src/ >>.gitignore
echo /filestore/ >>.gitignore
echo /logs/ >>.gitignore
