::==========
:: Add Dependency
::==========
start "" https://start.spring.io/


::==========
:: Update Path to Match Current ENV
::==========
SystemPropertiesAdvanced 
set ECLIPSE_HOME=C:\Coding Environment\eclipse
set JAVA_HOME=C:\Essential Utility\JDK\jdk-11.0.12

start "eclipse" "%ECLIPSE_HOME%\eclipse.exe" -vm "%JAVA_HOME%\bin\javaw.exe" -data .