
/**
 clang命令参数：
     -x: 指定编译文件语言类型
     -g: 生成调试信息
     -c: 生成目标文件，只运行preprocess，compile，assemble，不链接
     -o: 输出文件
     -isysroot: 使用的SDK路径
     1. -I<directory> 在指定目录寻找头文件 header search path
     2. -L<dir> 指定库文件路径（.a\.dylib库文件） library search path
     3. -l<library_name> 指定链接的库文件名称（.a\.dylib库文件）other link flags -lAFNetworking
     -F<directory> 在指定目录寻找framework framework search path
     -framework <framework_name> 指定链接的framework名称 other link flags -framework AFNetworking
 */

/**
    将test.m编译成test.o:
    1. 使用OC
    2. 生成的是X86_64_macOS架构的代码
        Big Sur是：x86_64-apple-macos11.1，之前是：x86_64-apple-macos10.15
    3. 使用ARC
    4. 使用的SDK的路径在：
        Big Sur是：/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk
        之前是：/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk
    5. 用到的其他库的头文件地址在./Frameworks
 */
clang -x objective-c \
-target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk \
-I./StaticLibrary \
-c test.m -o test.o

clang -x objective-c \
-target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk \
-c TestExample.m -o TestExample.o

/**
    test.o链接libTestExample.a生成test可执行文件
    -L./StaticLibrary 在当前目录的子目录StaticLibrary查找需要的库文件
    -lTestExample 链接的名称为libTestExample/TestExample的动态库或者静态库
    查找规则：先找lib+<library_name>的动态库，找不到，再去找lib+<library_name>的静态库，还找不到，就报错
 */
clang -target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk \
-L./StaticLibrary \
-lTestExample \
test.o -o test

/**
    test.o链接libTestExample.a生成test可执行文件
    -L./StaticLibrary 在当前目录的子目录StaticLibrary查找需要的库文件
    -lTestExample 链接的名称为libTestExample/TestExample的动态库或者静态库
    查找规则：先找lib+<library_name>的动态库，找不到，再去找lib+<library_name>的静态库，还找不到，就报错
    -syslibroot: 系统库文件的目录
 */
ld -syslibroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk -lsystem -framework Foundation -lTestExample -L./StaticLibrary test.o -o test


/**
    将test.m编译成test.o:
    1. 使用OC
    2. 生成的是X86_64_macOS架构的代码
        Big Sur是：x86_64-apple-macos11.1，之前是：x86_64-apple-macos10.15
    3. 使用ARC
    4. 使用的SDK的路径在：
        Big Sur是：/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk
        之前是：/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk
    5. 用到的其他库的头文件地址在./Frameworks/TestExample.framework/Headers
 */
clang -x objective-c  \
-target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk \
-I./Frameworks/TestExample.framework/Headers \
-c test.m -o test.o


/**
    test.o链接TestExample.framework生成test可执行文件
    -F./Frameworks 在当前目录的子目录Frameworks查找需要的库文件
    -framework TestExample 链接的名称为TestExample.framework的动态库或者静态库
    查找规则：先找TestExample.framework的动态库，找不到，再去找TestExample.framework的静态库，还找不到，就报错
 */
clang -target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk \
-F./Frameworks \
-framework TestExample \
test.o -o test

clang -x objective-c -fmodules \
-target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk \
-I./Frameworks/TestExample.framework/Headers \
-c test.m -o test.o

clang -target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk \
-F./Frameworks \
-framework TestExample \
test.o -o test

/**
 LC_LINKER_OPTION

链接器的特性，`Auto-Link`。启用这个特性后，当我们`import <模块>`，不需要我们再去往链接器去配置链接参数。比如`import <framework>`我们在代码里使用这个是framework格式的库文件，那么在生成目标文件时，会自动在目标文件的`Mach-O`中，插入一个 `load command`格式是`LC_LINKER_OPTION`，存储这样一个链接器参数`-framework <framework>`。
 */

/**
 `ar`压缩目标文件，并对其进行编号和索引，形成静态库。同时也可以解压缩静态库，查看有哪些目标文件：
 ar -rc a.a a.o
    -r: 像a.a添加or替换文件
    -c: 不输出任何信息
    -t: 列出包含的目标文件
 */

/**
    libtool -static -o <OUTPUT NAME> <LIBRARY_1> <LIBRARY_2>
 */
