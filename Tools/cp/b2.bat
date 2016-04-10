@ECHO OFF
REM Calls Boost Build. The idea is by using this script it's possible to have
REM switch between multiple versions of Boost Build in effect, which is
REM necessary given how brittle a working setup can be.

SET BOOST_ROOT="%TOOLS_LOCAL%\boost\boost_%BOOST_VERSION%"

"%BOOST_ROOT%\bjam.exe" --user-config=%~dp0\..\BoostBuild\user-config-%BOOST_VERSION%.jam %*
