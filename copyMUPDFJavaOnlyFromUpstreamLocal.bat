ECHO Make sure to run 'make generate' after getting new upstream version > copyFromUpstreamLOG.txt
SET "upstreamDir=..\..\3pREPO\AndroidLibs\MUPDF\mupdf"
SET "destLibDir=.\extlibs\muPDF"

del /S /F /Q %destLibDir%\src\main\java\* >> copyFromUpstreamLOG.txt
xcopy /S /Y /F /I %upstreamDir%\platform\android\src %destLibDir%\src\main\java >> copyFromUpstreamLOG.txt
del /S /F /Q %destLibDir%\src\main\res\* >> copyFromUpstreamLOG.txt
xcopy /S /Y /F /I %upstreamDir%\platform\android\res %destLibDir%\src\main\res >> copyFromUpstreamLOG.txt
xcopy /Y /F %upstreamDir%\platform\android\AndroidManifest.xml %destLibDir%\src\main\ >> copyFromUpstreamLOG.txt
REM copy SO file from the extlibs project (once CI will support NDK build then we can build them together)
xcopy /Y /F %destLibDir%\extlibs\android-pdf-library\src\main\libs\armeabi-v7a\libmupdf.so %destLibDir%\app\main\jniLibs\armeabi-v7a\ >> copyFromUpstreamLOG.txt