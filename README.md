# FFMPEG

#### 介绍
VS编译FFMPEG

原始项目地址：https://github.com/ShiftMediaProject/FFmpeg 

该项目编译方法：https://blog.csdn.net/luckywll/article/details/85792097

我这里只是将依赖的项目、需要单独下载的头文件、工具全部放进来，直接就可以打开vs编译了。


#### 安装教程

1. nasm和yasm在tool下面，将对应版本的yasm.exe和nasm.exe拷贝到vs下面。<br>
vs2013: C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\bin<br>
vs2015: C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin<br>
vs2017: C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC<br>
2. nasm和yasm分别有3个配置文件.xml,.props,.targets,拷贝到vs下面。<br>
 vs2013: C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V120\BuildCustomizations <br>
 vs2015: C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V140\BuildCustomizations <br>
 vs2017: C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\VC\VCTargets\BuildCustomizations<br>
3. 打开\code\Ffmpeg\SMP\ ffmpeg_deps.sln就可以编译了

#### 配置说明
1. Debug/Release 第三方库和ffmpegSDK都是静态库
2. DebugDLL/ReleaseDLL 第三方库和ffmpegSDK都是DLL。libvpx我改成了静态库，因为里面有个导出变量，外面引用的话链接时会找不到符号，要用dll必须修改代码才行。
3. DebugDLLStaticDeps/ReleaseDLLStaticDeps ffmpegSDK是DLL,第三方库是静态库。一般都是用的这种方案。
3. ReleaseLTO 给windows UWP使用的，可能需要win10和最新的vs及sdk，我暂时还没编过。