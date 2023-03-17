@ECHO OFF

IF "%WINDDKROOT%" == "" (
 SET WINDDKROOT=C:\WinDDK\7600.16385.1
 ECHO WINDDKROOT has been set to %WINDDKROOT%
)

IF /I "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
 SET WDK_TARGET_ARCH=x64
) ELSE (
 SET WDK_TARGET_ARCH=i386
)
SET WDK_TARGET_OS=win7

:ParseArgs
IF /I "%~1" == "/x86"   SET "WDK_TARGET_ARCH=i386" & SHIFT & GOTO ParseArgs
IF /I "%~1" == "/x64"   SET "WDK_TARGET_ARCH=x64"  & SHIFT & GOTO ParseArgs
IF /I "%~1" == "/stl6"  SET "WDK_STL_PATH=stl60"   & SHIFT & GOTO ParseArgs
IF /I "%~1" == "/stl7"  SET "WDK_STL_PATH=stl70"   & SHIFT & GOTO ParseArgs
IF /I "%~1" == "/xp"    SET "WDK_TARGET_OS=WXP"    & SHIFT & GOTO ParseArgs
IF /I "%~1" == "/vista" SET "WDK_TARGET_OS=Wlh"    & SHIFT & GOTO ParseArgs
IF /I "%~1" == "/win7"  SET "WDK_TARGET_OS=win7"   & SHIFT & GOTO ParseArgs
IF /I "%~1" == "-h" GOTO Usage
IF /I "%~1" == "/?" GOTO Usage
IF  "[%~1]" == "[]" GOTO DoneArgs
ECHO Unknown command-line switch: %~1
GOTO Usage
:DoneArgs

IF "%WDK_TARGET_ARCH%" == "x64" (
 SET WDK_LIB_ARCH=amd64
) ELSE (
 SET WDK_LIB_ARCH=i386
)
CALL %WINDDKROOT%\bin\setenv.bat %WINDDKROOT%\ fre %WDK_TARGET_ARCH% %WDK_TARGET_OS% && CD /D "%CD%"
SET INCLUDE=%INCLUDE%;%WINDDKROOT%\inc\crt;%WINDDKROOT%\inc\api\crt\%WDK_STL_PATH%
SET LIB=%LIB%;%WINDDKROOT%\lib\crt\%WDK_LIB_ARCH%;%WINDDKROOT%\lib\%WDK_TARGET_OS%\%WDK_LIB_ARCH%

SET WDK_TARGET_ARCH=
SET WDK_TARGET_OS=
SET WDK_STL_PATH=
SET WDK_LIB_ARCH=

GOTO :EOF

:Usage
SET WDK_TARGET_ARCH=
SET WDK_TARGET_OS=
SET WDK_STL_PATH=
ECHO Usage: StartDDK [/x86^|/x64] [/stl6^|/stl7] [/xp^|/vista^|/win7]
EXIT /B 1
