#import <Foundation/Foundation.h>
//眼 mudule -> .h
// .h -> 二进制
#import "TestExample.h"

int main(){
    NSLog(@"testApp----");
    TestExample *manager = [TestExample new];
    [manager lg_test: nil];
    return 0;
}




