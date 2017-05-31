//
//  main.m
//  Threelow
//
//  Created by Alex Lee on 2017-05-31.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

//USE THESE SYMBOLS --> ⚀ ⚁ ⚂ ⚃ ⚄ ⚅

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        InputHandler *inputHandler = [[InputHandler alloc] init];
        GameController *gameController = [[GameController alloc] init];
        
        NSLog(@"Welcome to Threelow!");
        //create the array of dice, roll them all once, and display their values
        [gameController rollAllDice];
        [gameController printFaces];
        
        BOOL play = YES;
        while (play) {
            NSString *userInput = [inputHandler inputForPrompt:@"What would you like to do? (hint --> 'roll' to re-roll the dice | 'hold' to select dice to hold on to/un-hold) | 'quit' to stop playing: "];
            
            if ([userInput isEqualToString:@"quit"]) {
                play = NO;
                continue;
            } else if ([userInput isEqualToString:@"roll"]) {
                
                NSLog(@"New values of dice (a face value wrapped in [] indicates that die has been held):");
                [gameController rollAllDice];
                [gameController printFaces];
                
            } else if ([userInput isEqualToString:@"hold"]) {
                BOOL holdEntry = YES;
                while (holdEntry) {
                    userInput = [inputHandler inputForPrompt:@"Enter the # of the dice you want to keep a hold of (or, 'stop' to cancel): "];
                    if ([userInput isEqualToString:@"stop"]) {
                        holdEntry = NO;
                        continue;
                    }
                    NSInteger diceNum = [userInput integerValue];
                    [gameController holdDie:diceNum];
                }
            }
            
        }
        
        NSLog(@"Thanks for playing!");
        
    }
    return 0;
}
