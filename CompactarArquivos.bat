@echo off
setlocal EnableDelayedExpansion

:: ============================
:: Validação de parâmetros
:: ============================
if "%~1"=="" (
    echo É necessário informar parâmetros de inicialização.
    echo.
    echo Uso:
    echo   compactar.bat "C:\Arquivos\Log" ".csv" "Planilhas" [del] [30]
    echo.
    echo Exemplo:
    echo   compactar.bat "C:\Arquivos\Log" ".csv" "Planilhas"
    echo   compactar.bat "C:\Arquivos\Log" ".csv" "Planilhas" del 30
    exit /b 1
)

if "%~3"=="" (
    echo Parâmetros insuficientes.
    exit /b 1
)

set "PATH_FILES=%~1"
set "EXTENSION=%~2"
set "ZIP_NAME=%~3"
set "DEL_FLAG=%~4"
set "DEL_DAYS=%~5"

:: ============================
:: Valida caminho absoluto
:: ============================
echo %PATH_FILES% | findstr /R "^[A-Za-z]:" >nul
if errorlevel 1 (
    echo Caminho inválido. Informe um caminho absoluto.
    exit /b 1
)

:: ============================
:: Compactação
:: ============================
set "ZIP_PATH=%PATH_FILES%\%ZIP_NAME%.zip"

echo Compactando arquivos %EXTENSION% em %ZIP_PATH% ...

powershell -NoProfile -Command ^
    "Compress-Archive -Path '%PATH_FILES%\*%EXTENSION%' -DestinationPath '%ZIP_PATH%' -Force"

if errorlevel 1 (
    echo Erro ao compactar arquivos.
    exit /b 1
)

echo Compactação concluída.

:: ============================
:: Exclusão opcional
:: ============================
if /I "%DEL_FLAG%"=="del" (
    if "%DEL_DAYS%"=="" (
        echo Parâmetro de dias não informado para exclusão.
        exit /b 1
    )

    echo Excluindo arquivos ZIP com mais de %DEL_DAYS% dias...

    powershell -NoProfile -Command ^
        "Get-ChildItem '%PATH_FILES%\*.zip' | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-%DEL_DAYS%) } | Remove-Item -Force"

    echo Exclusão concluída.
)
endlocal
