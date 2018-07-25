//
//  ViewController.m
//  StringCompare_Demo
//
//  Created by SuShi on 25/07/2018.
//  Copyright © 2018 SuShi. All rights reserved.
//

#import "ViewController.h"
#include "stdio.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *string1 = @"a.2.bab";
    
    NSString *string2 = @"a.2.3a";
    
    NSString *result = [self compareFromA:string1 toStringB:string2];
    
    NSLog(@"string1%@string2", result);
}

- (NSString *)compareFromA:(NSString *)stringA toStringB:(NSString *)stringB
{
    const char *str1 = [stringA cStringUsingEncoding:NSASCIIStringEncoding];
    
    const char *str2 = [stringB cStringUsingEncoding:NSASCIIStringEncoding];
    
    const char *p1 = str1;
    const char *p2 = str2;
    
    unsigned long length1 = strlen(str1);
    unsigned long length2 = strlen(str2);
    
    unsigned long length = MIN(length1, length2);
    
    NSString *result = @"=";

    for (int i = 0; i < length; i ++) {
        
        if (p1[i] > p2[i] ) {
            
            result = @">";
            break;
            
        }else if (p1[i] < p2[i]) {
            
            result = @"<";
            break;
        }
    }
    
    if ([result isEqualToString:@"="]) {
       
        // 判断长度不同的情况
        if (length1 > length2) {
            
            result = @">";
            
        }else if (length1 < length2) {
         
            result = @"<";
        }
        
    }
    
    return result;
}


@end
