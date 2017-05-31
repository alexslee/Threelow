//
//  Dice.h
//  Threelow
//
//  Created by Alex Lee on 2017-05-31.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property (nonatomic,strong) NSArray *faces;

@property (nonatomic)NSInteger value;

@property (nonatomic,strong) NSString *rolledFace;

- (void)roll;

- (NSString *)getFace;

- (NSInteger)getValue;

@end
