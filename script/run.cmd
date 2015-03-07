@echo off
setlocal
call :SetConfig %~dp0. %~dp0..
cabal exec runhaskell -- ^
  -i%PROJECTDIR%/src/lib ^
  %PROJECTDIR%/src/app/Main.hs
goto :eof

:SetConfig
set SCRIPTDIR=%~df1
set PROJECTDIR=%~df2
goto :eof
