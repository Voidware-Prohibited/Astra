
@echo off
chcp 65001 > nul
:::
:::     ░▒▓██████▓▒░ ░▒▓███████▓▒░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░
:::    ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
:::    ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
:::    ░▒▓████████▓▒░░▒▓██████▓▒░░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░░▒▓████████▓▒░
:::    ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
:::    ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
:::    ░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
:::
:::    ┏━┃┏━ ┛┏┏ ┏━┃   ┃   ┏━┃┃ ┃┏━┃┏━┃
:::    ┏━┃┃ ┃┃┃┃┃┏━┃  ━┏┛  ┏━┃┃ ┃┏┏┛┏━┃
:::    ┛ ┛┛ ┛┛┛┛┛┛ ┛   ┛   ┛ ┛━━┛┛ ┛┛ ┛
:::

for /f "delims=: tokens=*" %%x in ('findstr /b ::: "%~f0"') do @echo(%%x
chcp 1252 > nul
echo. & echo ^>Implementation soon. Press ANY key to EXIT . . . & pause > nul & Exit

:: Batch script to prompt for hmac secret and a prompt asking to input the api key, secret and callback url for one or more oauth2 providers from selectable options

@echo off
setlocal enabledelayedexpansion

:main
cls
echo.
echo --- Configuration Script ---
echo.
echo 1. Set HMAC Secret
echo 2. Configure OAuth2 Providers
echo 3. View Current Configuration
echo 4. Exit
echo.
set /p "choice=Enter your choice: "

if "%choice%"=="1" goto hmac_config
if "%choice%"=="2" goto oauth_config
if "%choice%"=="3" goto view_config
if "%choice%"=="4" goto :eof
echo Invalid choice. Please try again.
pause
goto main

:hmac_config
cls
echo --- HMAC Secret Configuration ---
echo.
set /p "hmac_secret=Enter the new HMAC secret: "
if not defined hmac_secret (
    echo A secret is required.
    pause
    goto hmac_config
)
echo HMAC_SECRET=!hmac_secret! > config.ini
echo.
echo HMAC secret saved to config.ini.
pause
goto main

:oauth_config
cls
echo --- OAuth2 Provider Configuration ---
echo.
echo Available providers:
echo 1. Google
echo 2. GitHub
echo 3. Custom
echo 4. Back to main menu
echo.
set /p "provider_choice=Enter your choice: "

if "%provider_choice%"=="4" goto main

set provider_name=
if "%provider_choice%"=="1" set provider_name=Google
if "%provider_choice%"=="2" set provider_name=GitHub
if "%provider_choice%"=="3" set provider_name=Custom

if not defined provider_name (
    echo Invalid choice.
    pause
    goto oauth_config
)

:prompt_oauth
cls
echo --- %provider_name% OAuth2 Details ---
set /p "api_key=Enter API Key: "
set /p "api_secret=Enter API Secret: "
set /p "callback_url=Enter Callback URL: "

if not defined api_key (
    echo API Key is required.
    pause
    goto prompt_oauth
)
if not defined api_secret (
    echo API Secret is required.
    pause
    goto prompt_oauth
)
if not defined callback_url (
    echo Callback URL is required.
    pause
    goto prompt_oauth
)

echo [%provider_name%] >> config.ini
echo API_KEY=!api_key! >> config.ini
echo API_SECRET=!api_secret! >> config.ini
echo CALLBACK_URL=!callback_url! >> config.ini
echo.
echo %provider_name% OAuth2 details saved to config.ini.
pause
goto oauth_config

:view_config
cls
echo --- Current Configuration ---
echo.
if exist config.ini (
    type config.ini
) else (
    echo config.ini does not exist.
)
pause
goto main

:eof
endlocal
exit

