 [~/Desktop/VIP课程/第三节、动态库与静态库/静态库/上课代码/链接静态库AFNetworking/AFNetworking]$
 file libAFNetworking.a
[~/Desktop/VIP课程/第三节、动态库与静态库/静态库/上课代码/链接静态库AFNetworking/AFNetworking]$
ar -t libAFNetworking.a

[~/Desktop/VIP课程/第三节、动态库与静态库/静态库/上课代码/链接静态库AFNetworking]$ clang -x objective-c \
-target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk \
-c TestExample.m -o TestExample.o

[~/Desktop/VIP课程/第三节、动态库与静态库/静态库/上课代码/链接静态库AFNetworking]$ clang -target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk \
-L./AFNetworking \
-lAFNetworking \
test.o -o test

[~/Desktop/VIP课程/第三节、动态库与静态库/静态库/上课代码/静态库原理]$ clang -x objective-c \
-target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk \
-c TestExample.m -o TestExample.o

[~/Desktop/VIP课程/第三节、动态库与静态库/静态库/上课代码/静态库原理]$ file libTestExample.dylib


[~/Desktop/VIP课程/第三节、动态库与静态库/静态库/上课代码/静态库原理]$ clang -x objective-c \
-target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk \
-I./StaticLibrary \
-c test.m -o test.o

