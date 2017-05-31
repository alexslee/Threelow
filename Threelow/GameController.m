//
//  GameController.m
//  Threelow
//
//  Created by Alex Lee on 2017-05-31.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (instancetype)init {
    if (self = [super init]) {
        _gameDice = [[NSMutableArray alloc] init];
        
        for (unsigned i = 0; i < NUMBEROFDICE; i++) {
            _gameDice[i] = [[Dice alloc] init];
            [_gameDice[i] roll];
        }
        
        _heldDice = [[NSMutableArray alloc] init];
        
        for (unsigned i = 0; i < NUMBEROFDICE; i++) {
            _heldDice[i] = [[NSNumber alloc] initWithBool:NO];
        }
        
        _score = 0;
        _highScore = INFINITY;
    }
    return self;
}

- (void)rollAllDice;
{
    
    for (unsigned i = 0; i < NUMBEROFDICE; i++) {
        NSNumber *shouldHold = [_heldDice objectAtIndex:i];
        //don't roll the die if it was held by the user
        if ([shouldHold boolValue] == NO) {
            [_gameDice[i] roll];
        } else {
            //if held, just add the value to the score
        }
    }
}

- (void)printFaces;
{
    _score = 0;

    for (unsigned i = 0; i < NUMBEROFDICE; i++) {
        NSNumber *wasHeld = [_heldDice objectAtIndex:i];
        Dice *die = _gameDice[i];
        NSString *face = [die getFace];
        
        //check if dice was held, to determine how to print the face value
        if ([wasHeld boolValue] == NO) {
            NSLog(@"Dice %tu: %@",[_gameDice indexOfObject:die],face);
        } else {
            _score += [die getValue];
            NSLog(@"Dice %tu: [%@]",[_gameDice indexOfObject:die],face);
        }
        
    }
    
    NSLog(@"Current score: %ld points",_score);
}

- (void)holdDie:(NSInteger)diceNum;
{
    if (diceNum >= 0 && diceNum < NUMBEROFDICE) {
        
        //keep track of which dice has been held by parallel indexing in an array of bools
        BOOL held = NO;
        
        if ([[_heldDice objectAtIndex:diceNum] boolValue] == YES) {
            [_heldDice replaceObjectAtIndex:diceNum withObject:[NSNumber numberWithBool:held]];
            NSLog(@"Die %ld has been un-held.",diceNum);
        } else {
            held = YES;
            [_heldDice replaceObjectAtIndex:diceNum withObject:[NSNumber numberWithBool:held]];
            NSLog(@"Die %ld has been held.",diceNum);
        }
        
    } else {
        NSLog(@"Error, invalid index given!");
    }
}

- (void)resetDice;
{
    //reset every bool tracker in heldDice to false
    for (unsigned i = 0; i < NUMBEROFDICE; i++) {
        [_heldDice replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
    }
}

- (void)gameOver;
{
    //keep the high score if applicable, and reset the score
    _highScore = (_score < _highScore) ? _score : _highScore;
    _score = 0;
    NSLog(@"Final score: %ld || High score to beat: %ld",_score,_highScore);
    
    NSLog(@"Let's play again.");
    [self resetDice];
    [self rollAllDice];
    NSLog(@"=== Current game status ===");
    [self printFaces];
}

@end
