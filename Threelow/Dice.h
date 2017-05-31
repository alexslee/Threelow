//
//  Dice.h
//  Threelow
//
//  Created by Alex Lee on 2017-05-31.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

/*****PROPERTIES*****/

//each die has access to the list of faces
@property (nonatomic,strong) NSArray *faces;

//holds the face value of the die
@property (nonatomic)NSInteger value;

//holds the face itself
@property (nonatomic,strong) NSString *rolledFace;

/*****METHODS*****/
//rolls the die
- (void)roll;

//returns the face of the die
- (NSString *)getFace;

//returns the face's value
- (NSInteger)getValue;

@end
