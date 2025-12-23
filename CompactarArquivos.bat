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
:: Compactação com tar.exe
:: ============================
set "ZIP_PATH=%PATH_FILES%\%ZIP_NAME%.zip"

pushd "%PATH_FILES%" || exit /b 1

echo Compactando arquivos %EXTENSION% em %ZIP_PATH% ...

:: Remove o ZIP se já existir (equivalente ao FileMode.Create)
if exist "%ZIP_PATH%" del "%ZIP_PATH%"

tar -a -c -f "%ZIP_PATH%" *%EXTENSION%

if errorlevel 1 (
    echo Erro ao compactar arquivos.
    popd
    exit /b 1
)

popd
echo Compactação concluída.

:: ============================
:: Exclusão opcional (ZIP antigos)
:: ============================
if /I "%DEL_FLAG%"=="del" (
    if "%DEL_DAYS%"=="" (
        echo Quantidade de dias não informada.
        exit /b 1
    )

    echo Excluindo arquivos ZIP com mais de %DEL_DAYS% dias...

    forfiles /P "%PATH_FILES%" /M *.zip /D -%DEL_DAYS% /C "cmd /c del @path"

    echo Exclusão concluída.
)

endlocal
