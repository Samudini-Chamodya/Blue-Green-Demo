@echo off
curl http://localhost:%1
if %errorlevel% neq 0 exit /b 1
exit /b 0