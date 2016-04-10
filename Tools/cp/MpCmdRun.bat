REM Runs Windows Defender to scan a file.
"%PROGRAMFILES%\Windows Defender\MpCmdRun.exe" -scan -scantype 3 -SignatureUpdate -file %*
