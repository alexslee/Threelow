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

/*****PROPERTIES*****/

@property (nonatomic,strong)NSMutableArray *gameDice;

@property (nonatomic,strong)NSMutableArray *heldDice;

@property (nonatomic)NSInteger score;

@property (nonatomic)NSInteger highScore;

/*****METHODS*****/

- (void)rollAllDice;

- (void)printFaces;

- (void)holdDie:(NSInteger)diceNum;

- (void)resetDice;

- (void)gameOver;

@end
