REM Installs Boost Build. Requires Compiler.

SET BOOST_ROOT="%TOOLS_LOCAL%\boost\boost_%BOOST_VERSION%"

cd %BOOST_ROOT%
echo "Calling Bootstrap in %BOOST_ROOT%..."
call bootstrap
if %errorlevel% neq 0 exit /b %errorlevel%
echo "Building- hopefully you remembered to include --with-blah and "
echo "address-mode=32|64 and toolset=msvc-14.0..."
echo "Building Test libraries..."
call b2 --build-type=complete stage --user-config=%~dp0\..\BoostBuild\user-config-%BOOST_VERSION%.jam %*
if %errorlevel% neq 0 exit /b %errorlevel%
