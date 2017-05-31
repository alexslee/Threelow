//
//  InputHandler.m
//  Maths
//
//  Created by Alex Lee on 2017-05-30.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "InputHandler.h"
@implementation InputHandler

- (NSString *)parser:(char*)rawInput;
{
    //convert C string to NSString
    NSString *convertedStr = [NSString stringWithCString:rawInput encoding:NSUTF8StringEncoding];
    //format by removing any trailing and leading spaces/new lines
    NSString *trimmed = [convertedStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    return trimmed;
}

- (NSString *)inputForPrompt:(NSString *)promptString;
{
    char str[255];
    NSLog(@"%@",promptString);
    fgets(str, 255, stdin);
    NSString *trimmed = [self parser:str];
    return trimmed;
}

@end
