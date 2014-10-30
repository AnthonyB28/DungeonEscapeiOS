//
//  QuitScreen.h
//  DungeonEscape
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "cocos2d.h"

@interface QuitScreen : CCLayer

/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Constructor for the main screen */
- (id) init;

/** Handles pressing back button*/
- (void) onBack: (CCMenuItemFont*) button;

/** Handles pressing quit button*/
- (void) onQuit: (CCMenuItemFont*) button;

@end

