//
//  ViewController.m
//  Shell_TestDemo
//
//  Created by liupenghui on 2021/3/13.
//

#import "ViewController.h"

@interface ViewController ()
/*
 *<#Description#>
 */
@property(nonatomic, strong)NSMutableArray * array;
@end

@implementation ViewController

-(NSString *)a{
    return @"DD";
//    return [NSString stringWithFormat:@"AA-%d",i++];
}
-(NSString *)b{
    return @"B";
//    return [NSString stringWithFormat:@"AA-%d",i++];
}

-(void)setTest{
    
    
    dispatch_queue_t serisQun = dispatch_queue_create("penguin", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_t serisQun2 = dispatch_queue_create("penguin2", DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"开始");
    
    dispatch_async(serisQun, ^{
        
        dispatch_async(serisQun2, ^{
            @synchronized (self) {
                NSArray * fingerKeys = @[@"a",@"a",@"a",@"a",@"a",@"b",@"a",@"a",@"a",@"a",@"a"];
                
                __block NSMutableString *fingerInfos = [[NSMutableString alloc] init];
                dispatch_queue_t queue =dispatch_queue_create("com.WLoginFingerManager.fingerInfos", DISPATCH_QUEUE_SERIAL);
                dispatch_apply(fingerKeys.count, queue, ^(size_t index) {
                    NSString *fingerKey = fingerKeys[index];
                    NSString *fingerValue = [self valueForKey:fingerKey];;
                    if ([fingerKey isEqual:@"b"]) {
                        sleep(6);
                        
                    }
                    
                    [fingerInfos appendFormat:@"%@＃", fingerValue];
                });
                NSLog(@"%@",fingerInfos);
            }
        });
        
        
        dispatch_async(serisQun2, ^{
            
            for (int i = 0; i < 10; i++) {
                sleep(1);
                NSLog(@"第二个%d-%@",i,[NSThread currentThread]);
            }
            
        });
        
    });
    NSLog(@"结束");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setTest];
    
    
//    [self setArrTest];

    
    // Do any additional setup after loading the view.
}


-(void)setArrTest{
    self.array = [NSMutableArray array];
    
    [self doInsert];
}

-(void)doInsert{
    for (int i = 0; i < 10; i ++) {
        [self.array addObject:[NSString stringWithFormat:@"A + %d",i]];
    }
    
    [self getIndexOf:9];
}

-(NSString *)getIndexOf:(NSInteger *)index{
    NSInteger i = index + 1;
    NSString * string = [self.array objectAtIndex:i];
    return  string;
}

@end
