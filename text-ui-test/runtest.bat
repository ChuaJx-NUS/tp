@ECHO OFF

REM Build duke.jar from the project root using Java 25.
call ..\gradlew.bat -p .. -q shadowJar
IF ERRORLEVEL 1 (
    echo ********** BUILD FAILURE **********
    exit /b 1
)

REM Feed input.txt to the program and capture its output.
java -jar ..\build\libs\duke.jar < input.txt > ACTUAL.TXT

REM Compare the actual and expected output.
fc /N ACTUAL.TXT EXPECTED.TXT
IF ERRORLEVEL 1 (
    echo Test result: FAILED
    exit /b 1
)

echo Test result: PASSED
exit /b 0