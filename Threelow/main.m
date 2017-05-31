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
        
        NSInteger rollsSinceReset = 0;
        NSInteger gamesPlayed = 0;
        BOOL play = YES;
        BOOL hasHeld = NO;
        
        //game loop
        while (play) {
            NSString *userInput = [inputHandler inputForPrompt:@"What would you like to do? (hint --> 'roll' to re-roll the dice (must hold at least one die before rolling again!) | 'hold' to select dice to hold on to/un-hold) | 'reset' to un-hold all dice | 'print' to print all dice values and current score | 'new game' to reset the high score, if you've played a game already | 'quit' to stop playing: "];
            
            if ([userInput isEqualToString:@"quit"]) {
                
                play = NO;
                continue;
                
            } else if ([userInput isEqualToString:@"roll"]) {
                //only roll if player has held at least one die
                if (hasHeld) {
                    NSLog(@"New values of dice (a face value wrapped in [] indicates that die has been held):");
                    [gameController rollAllDice];
                    rollsSinceReset++;
                    
                    NSLog(@"=== Current game status ===");
                    NSLog(@"Rolls since last reset: %ld\n",rollsSinceReset);
                    [gameController printFaces];
                    hasHeld = NO;
                    //set limit to # of rolls per game
                    if (rollsSinceReset == 5) {
                        NSLog(@"===Game over!!===");
                        [gameController gameOver];
                        rollsSinceReset = 0;
                    }
                    
                } else {
                    NSLog(@"You haven't chosen at least one die to hold onto yet! Do that first, then roll.");
                }
                
            } else if ([userInput isEqualToString:@"hold"]) {
                
                BOOL holdEntry = YES;
                //keep allowing user to hold/unhold until 'stop' is entered
                while (holdEntry) {
                    userInput = [inputHandler inputForPrompt:@"Enter the # of the die you want to keep a hold of (or, 'stop' to stop): "];
                    
                    if ([userInput isEqualToString:@"stop"]) {
                        holdEntry = NO;
                        continue;
                    }
                    
                    NSInteger diceNum = [userInput integerValue];
                    [gameController holdDie:diceNum];
                    
                    hasHeld = true;
                }
                
            } else if ([userInput isEqualToString:@"reset"]) {
                
                [gameController resetDice];
                rollsSinceReset = 0;
                
            } else if ([userInput isEqualToString:@"print"]) {
                
                NSLog(@"=== Current game status ===");
                NSLog(@"Rolls since last reset: %ld\n",rollsSinceReset);
                [gameController printFaces];
                
            } else if ([userInput isEqualToString:@"new game"]) {
                //allow user to reset high score if at least one game is played
                if(gamesPlayed > 0) {
                    NSLog(@"Resetting high score.");
                    [gameController resetHighScore];
                } else {
                    NSLog(@"Play a game first before you reset the high score!");
                }
                
            } else if ([userInput isEqualToString:@"roIl"]) {
                //EASTER EGG!
                NSLog(@"You found the easter egg! You win with a score of 0! Reset this by using 'new game', or try to beat this score (friendly hint - you can't).");
                [gameController easterEgg];
                
            } else {
                NSLog(@"I'm sorry, I didn't catch that command.");
            }
            
        }
        
        NSLog(@"Thanks for playing!");
        
    }
    return 0;
}
