#!/usr/bin/env fish
# create new folder for odoo dev


mkdir src wirazd static report models controllers views security data demo i18n
mkdir static/description
# mkdir static/src
mkdir static/src
mkdir static/src/js static/src/xml static/src/csss static/src/sccs
touch src/__init__.py
touch controllers/__init__.py
touch wirazd/__init__.py
touch views/views.xml
touch __init__.py
touch __manifest__.py
echo "{
        'name': 'Hoang Long library',
        'summary': 'Long library',
        'author': 'Hoang Long',
        'description': 'Hoang Long',
        'category': 'Hoang Long app',
        'version': '1.0.0',
        'website': 'Hoang Long',
        }" >>__manifest__.py


tree
echo "Create .gitignore"
touch .gitignore
echo "# dotfile, with exception" >>.gitignore
echo ".*" >>.gitignore
echo "# python compile file" >>.gitignore
echo "*.py[co]" >>.gitignore
echo "#not track subdirectory" >>.gitignore
echo /env/ >>.gitignore
echo /src/ >>.gitignore
echo /filestore/ >>.gitignore
echo /logs/ >>.gitignore
echo DONE
