@echo off
cd ..\C:\Users\USER\Desktop\BlueGreenDemo\blue
call npm install
start /B cmd /c "set PORT=5000 && set APP_VERSION=%1 && node app.js"
