@echo off
setlocal
call :SetConfig %~dp0. %~dp0..
cabal exec runhaskell -- ^
  -i%PROJECTDIR%/src/spec ^
  -i%PROJECTDIR%/src/lib ^
   %PROJECTDIR%/src/spec/Spec.hs
goto :eof

:SetConfig
set SCRIPTDIR=%~df1
set PROJECTDIR=%~df2
goto :eof
