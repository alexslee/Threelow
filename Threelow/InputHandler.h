//
//  InputHandler.h
//  Threelow
//
//  Created by Alex Lee on 2017-05-31.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputHandler : NSObject

//uses an NSCharacterSet to format the user input
- (NSString *)parser:(char*)rawInput;

//use the given prompt to ask for input
- (NSString *)inputForPrompt:(NSString *)promptString;

@end

