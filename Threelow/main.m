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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Welcome to Threelow!");
        
        //create the array of dice, roll them all once, and display their values
        NSMutableArray *gameDice = [[NSMutableArray alloc] init];
        
        for (unsigned i = 0; i < 6; i++) {
            gameDice[i] = [[Dice alloc] init];
            [gameDice[i] roll];
            NSString *face = [gameDice[i] getFace];
            NSLog(@"Dice %tu: %@",i,face);
        }
        
    }
    return 0;
}
