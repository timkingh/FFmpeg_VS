
This is a small list of steps in order to build libharfbuzz into a msvc dll and/or lib file.

The project contains Release and Debug builds for static lib files (Debug/Release)
  as well as dynamic shared dll files (DebugDLL/ReleaseDLL). Along with the standard
  windows dll/lib configurations mentioned above there are also equivalent variants that
  can be used to compile for WinRT/UWP (These configurations have a WinRT suffix).
There are also architecture configurations for either 32bit (x86) or 64bit (x64) compilation.
Choose whichever project configuration meets your requirements.

The project configurations support being built with various different windows SDK versions.
  By default they will use the lowest SDK version that would be available for Visual Studio
  version 2013 and up (This is the 8.1 SDK). However a batch file is also included 
  (libharfbuzz_with_latest_sdk.bat) which can be used to auto detect the newest available SDK 
  installed on the host machine and then open the project using that as the compilation SDK.
  
When using the WinRT/UWP project configurations the projects will automatically compile towards
  the default application target for the Version of Visual Studio being used:
  VS 2013: 8.1
  VS 2015: 8.1
  VS 2017: 10.0.10240.0

By default when compiling a static lib the project will include static libs for any dependencies.
  Conversely when compiling a shared dll the project will link against shared libs for the dependencies.
  This behaviour can be changed by adding 1 of the following tags to the projects Preprocessor Definitions:
  SHARED_DEPS: To include all dependencies as shared libs.
  STATIC_DEPS: To include all dependencies as static libs.

