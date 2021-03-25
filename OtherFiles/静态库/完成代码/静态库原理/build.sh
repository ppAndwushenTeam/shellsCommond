LANGUAGE=objective-c
TAREGT=x86_64-apple-macos11.1
SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk

FILE_NAME=test
STATICLIBRARY=TestExample
HEAD_PATH=./StaticLibrary
LIBRARY_PATH=./StaticLibrary

echo "-------------编译test.m to test.o------------------"
clang -x $LANGUAGE  \
-target $TAREGT     \
-fobjc-arc          \
-isysroot $SYSROOT  \
-I${HEAD_PATH}   \
-c ${FILE_NAME}.m -o ${FILE_NAME}.o

echo "-------------进入到StaticLibrary目录------------------"
pushd ${HEAD_PATH}
echo "-------------编译TestExample.m to TestExample.o------------------"
clang -x $LANGUAGE  \
-target $TAREGT     \
-fobjc-arc          \
-isysroot $SYSROOT  \
-c ${STATICLIBRARY}.m -o ${STATICLIBRARY}.o
echo "-------------退出StaticLibrary目录------------------"

popd

echo "-------------test.o链接libTestExample.a to test EXEC------------------"
clang -target $TAREGT   \
-fobjc-arc              \
-isysroot $SYSROOT      \
-L${LIBRARY_PATH}       \
-l${STATICLIBRARY}           \
$FILE_NAME.o -o $FILE_NAME

