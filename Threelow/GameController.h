//
//  GameController.h
//  Threelow
//
//  Created by Alex Lee on 2017-05-31.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#define NUMBEROFDICE 6

@interface GameController : NSObject

@property (nonatomic,strong)NSMutableArray *gameDice;
@property (nonatomic,strong)NSMutableArray *heldDice;

- (void)rollAllDice;

- (void)printFaces;

- (void)holdDie:(NSInteger)diceNum;

@end