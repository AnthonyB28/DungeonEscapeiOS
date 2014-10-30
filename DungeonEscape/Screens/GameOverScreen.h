//
//  GameOverScene.h
//  DungeonEscape
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "cocos2d.h"

@interface GameOverScreen : CCLayer

/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Constructor for the main screen */
- (id) init;

/** Handles pressing the forward button to high scores*/
- (void) onForward: (CCMenuItemFont*) button;

/** Go back to main menu */
- (void) onMain: (CCMenuItemFont*) button;

@end
