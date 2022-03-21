# Y22 Project - Website using Python Flask and MariaDB

## Introduction
A group exploration of a new back-end framework.

The application requirements:
- Select a back-end framework;
- work as a team;
- make a working website;

## Features 

The application has the following features:
- User (admin) can login to edit "menu of the week"
- Login has password hash and cookie hash;
- Return user (admin) can use cookie hash to login;
- Login user can edit "menu of the week"


## Tech
The project uses the following language, toolkit, IDE, database etc...

- [Python] - The programming language used for this application
- [Flask] -  The back-end framework
- [VS Code] - IDE for the development
- [git] - version control

## Screenshot
![Application Screenshot](https://github.com/e-tao/Y22-GPRJ-Website_Flask/blob/main/screenshot/Y22_project_screenshot.PNG?raw=true)

## Team Notes
Hi team, there is a requirements.txt file included in the project, which tracks the package dependencies.
In the VSCode terminal run <em>`pip install -r requirements.txt`</em> to have all dependencies installed.

the package managment in Python is pip, so run 
<em>`pip install "package name goes here"`</em>

if any new package is installed, please run
<em>`pip freeze > requirements.txt`</em> to generate new requirements file.

please consider create your own <em><strong>yourname-dev-branch</strong></em> working branch, 
so we can keep the main safe from broken code.
We will ONLY merge the working code to main.

you can create your dev-branch after pull the main by using

  `git switch -c yourname-dev-branch`
  `git checkout -b yourname-dev-branch`

