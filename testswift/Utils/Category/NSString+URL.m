//
//  NSString+URL.m
//  testswift
//
//  Created by laps on 16/1/6.
//  Copyright © 2016年 laps. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString (URL)

- (NSString *)urlEncode
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (CFStringRef)self,
                                                                           NULL,
                                                                           CFSTR("!*'();:@&=+$,/?%#[]~"),
                                                                           kCFStringEncodingUTF8));
    return result;
}

@end
