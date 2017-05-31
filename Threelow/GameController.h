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

//rolls all dice that have not been held
- (void)rollAllDice;

//prints the game status
- (void)printFaces;

//toggles the 'held' status of each die in the heldDice array
- (void)holdDie:(NSInteger)diceNum;

//resets the game dice
- (void)resetDice;

//performs game over functionality (saving high score, resetting game dice, etc)
- (void)gameOver;

//resets the high score
- (void)resetHighScore;

//easter egg!
- (void)easterEgg;
@end
