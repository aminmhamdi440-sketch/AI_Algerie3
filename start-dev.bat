@echo off
echo Starting Titan Enterprise Local Environment...

:: Start Backend
start "Titan Backend" cmd /k "cd backend && npm run dev"

:: Start Frontend
start "Titan Frontend" cmd /k "cd frontend && npm run dev"

echo.
echo ========================================================
echo  Servers are starting...
echo  Backend will be at: http://localhost:3000
echo  Frontend will be at: http://localhost:3001
echo ========================================================
echo.
echo When ready, open your browser to: http://localhost:3001
pause
