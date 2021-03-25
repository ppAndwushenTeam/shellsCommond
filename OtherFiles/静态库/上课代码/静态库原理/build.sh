
SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.0.sdk
FILE_NAME=test
HEADER_SEARCH_PATH=./StaticLibrary

echo "-----开始编译test.m"
clang -x objective-c \
-target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot $SYSROOT \
-I${HEADER_SEARCH_PATH} \
-c ${FILE_NAME}.m -o ${FILE_NAME}.o

echo "-----开始进入StaticLibrary"
pushd ./StaticLibrary

clang -x objective-c \
-target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot $SYSROOT \
-c TestExample.m -o TestExample.o

ar -rc libTestExample.a TestExample.o
echo "-----开始退出StaticLibrary"
popd

echo "-----开始test.o to test EXEC"
clang -target x86_64-apple-macos11.1 \
-fobjc-arc \
-isysroot $SYSROOT \
-L./StaticLibrary \
-lTestExample \
${FILE_NAME}.o -o ${FILE_NAME}
