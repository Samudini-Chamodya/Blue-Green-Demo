@echo off
cd ..\green
call npm install
start /B cmd /c "set PORT=5001 && set APP_VERSION=%1 && node app.js"