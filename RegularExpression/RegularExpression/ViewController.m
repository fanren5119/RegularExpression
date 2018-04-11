//
//  ViewController.m
//  RegularExpression
//
//  Created by wanglei on 2018/4/11.
//  Copyright © 2018年 wanglei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *string = @"[aaa][bbb124=34258=]";
    NSString *regx = @"(?<=\\[)([^(\\[\\])]*)(?=\\])";

    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regx options:0 error:nil];
    NSArray *array = [regular matchesInString:string options:(NSMatchingReportCompletion) range:NSMakeRange(0, string.length)];

    for (NSTextCheckingResult *result in array) {
        NSString *component = [string substringWithRange:result.range];
        NSLog(@"component = %@", component);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
