:: CATopalian_PY_TOC_Generator_for_MD.bat

@echo off
setlocal enabledelayedexpansion

:: Output file name
set "output=TABLE_OF_CONTENTS_PY.md"

:: Clear existing output file
type nul > "%output%"

echo Generating Table of Contents...

:: Write Title Once
echo # Table of Contents >> "%output%"
echo. >> "%output%"
echo --- >> "%output%"
echo. >> "%output%"

:: Define closing parenthesis safely
set "CP=)"

:: Loop through subdirectories
for /r /d %%D in (*) do (
    set "hasPy=0"
    if exist "%%D\*.py" (
        set "hasPy=1"
    )

    if "!hasPy!"=="1" (
        set "folderName=%%~nxD"
        
        echo ### !folderName! >> "%output%"
        echo. >> "%output%"

        for %%F in ("%%D\*.py") do (
            set "fileName=%%~nxF"
            set "fullPath=%%~dpnF.py"
            set "relPath=!fullPath:%CD%\=!"
            set "webPath=!relPath:\=/!"
            
            :: Output formatted markdown link with safe closing parenthesis
            echo * [!fileName!](!webPath!!CP! >> "%output%"
            echo. >> "%output%"
        )
        
        echo --- >> "%output%"
        echo. >> "%output%"
    )
)

echo Table of Contents generated into %output% successfully.
pause

:: Dedicated to God the Father
:: (c) Copyright 2000-2026 Christopher Andrew Topalian. All Rights Reserved.
:: https://github.com/ChristopherAndrewTopalian
:: https://github.com/ChristopherTopalian
:: https://sites.google.com/view/CollegeOfScripting

