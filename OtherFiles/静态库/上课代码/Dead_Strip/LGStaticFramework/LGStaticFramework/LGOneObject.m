//
//  LGOneObject.m
//  LGStaticFramework
//
//  Created by ws on 2021/1/20.
//

#import "LGOneObject.h"
#import <LGOneObject+Category.h>

@implementation LGOneObject
- (void)lg_test {
    // dead_strip
    [self lg_test_category];
}
@end
