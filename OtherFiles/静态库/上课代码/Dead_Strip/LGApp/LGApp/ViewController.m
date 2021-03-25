//
//  ViewController.m
//  LGApp
//
//  Created by ws on 2021/1/20.
//

#import "ViewController.h"
#import <LGStaticFramework/LGOneObject.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LGOneObject *obj = [LGOneObject new];
    [obj lg_test];
}


@end
