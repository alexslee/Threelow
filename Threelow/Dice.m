//
//  Dice.m
//  Threelow
//
//  Created by Alex Lee on 2017-05-31.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype) init {
    
    if (self == [super init]) {
        _faces = @[@"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"];
    }
    
    return self;
}

- (void)roll;
{
    _value = arc4random_uniform(6) + 1;
    _rolledFace = [_faces objectAtIndex:(_value - 1)];
}

- (NSString *)getFace;
{
    return _rolledFace;
}

- (NSInteger)getValue;
{
    return _value;
}

@end
