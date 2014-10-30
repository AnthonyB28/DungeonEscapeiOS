//
//  MainScreen.h
//  DungeonEscape
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "cocos2d.h"

@interface MainScreen : CCLayer

/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Constructor for the main screen */
- (id) init;

/** Handles pressing the new game button*/
- (void) onNew: (CCMenuItemFont*) button;

/** Handles pressing the resume game button*/
- (void) onResume: (CCMenuItemFont*) button;

/** Handles pressing the options button*/
- (void) onOptions: (CCMenuItemFont*) button;

/** Handles pressing the quit button*/
- (void) onQuit: (CCMenuItemFont*) button;

@end