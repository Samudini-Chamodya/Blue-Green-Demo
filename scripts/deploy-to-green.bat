@echo off
cd ..\C:\Users\USER\Desktop\BlueGreenDemo\green
call npm install
start /B cmd /c "set PORT=5001 && set APP_VERSION=%1 && node app.js"