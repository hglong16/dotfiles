#!/usr/bin/env fish
# create new folder for odoo dev


mkdir src wirazd models controllers views security data demo i18n
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




echo -n ".
├── __init__.py
├── __manifest__.py
├── controllers
│   └── __init__.py
├── data
├── demo
├── i18n
├── models
├── security
├── src
│   └── __init__.py
├── views
│   └── views.xml
└── wirazd
    └── __init__.py

Create 9 directories, 6 files "
