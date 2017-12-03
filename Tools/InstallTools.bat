@if not defined BatchVerbose (@echo off)
setlocal
echo Copy VS debugger's NATVIS visualizers...
set VisualizersPath="C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Packages\Debugger\Visualizers"
copy *.natvis %VisualizersPath%
echo Install VSIX visualizers...
for /f "usebackq" %%I in (`dir /b *.vsix`) do %%I
endlocal
