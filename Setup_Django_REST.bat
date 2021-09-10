:: # Make project name
set projectDIR=projects
set projectName=REST_Project
set appName=initApp
:: echo %projectName%

:: # Create the project directory
mkdir %projectDIR%
cd %projectDIR%

:: # Create a virtual environment to isolate our package dependencies locally
python -m venv env
call .\env\Scripts\activate  
:: # On Windows use `.\env\Scripts\activate`
:: # On Linux `source .\env/bin/activate`  
:: # Install Django and Django REST framework into the virtual environment
:: # Or use pip install -r requirements.txt 

python -m pip install --upgrade pip
pip install django

:: # Set up a new project with a single application
:: # Note the trailing '.' character
django-admin startproject %projectName% 

:: # Make App in Projectrcmd
cd %projectName%
mkdir apps\%appName%
cd apps 
echo.> "__init__.py"
cd ..
python manage.py startapp %appName% apps\%appName%
cd ..
subl %projectName%

:: # Add Packages
cd %projectName%
echo django>"requirements.txt"
echo djangorestframework>>"requirements.txt"

:: # Create .env FILE
echo .env > .gitignore
echo SECRET_KEY>".env"

pip install -r requirements.txt

:: # Sync DB and Create Admin
python manage.py migrate
python manage.py createsuperuser --email admin@example.com --username admin

pause

:: https://stackoverflow.com/questions/22841764/best-practice-for-django-project-working-directory-structure
:: settings.py  'apps.initApp.apps.InitAppConfig',
:: apps.py 		name = 'apps.initApp'