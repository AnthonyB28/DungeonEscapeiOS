//
//  OptionsScreen.h
//  DungeonEscape
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "cocos2d.h"

@interface OptionsScreen : CCLayer

/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Constructor for the main screen */
- (id) init;

/** Handles pressing the back button */
- (void) onBack: (CCMenuItemFont*) button;

/** Handles pressing the Audio button*/
- (void) onAudio: (CCMenuItemFont*) button;

/** Handles pressing the Skill level button*/
- (void) onSkill: (CCMenuItemFont*) button;

/** Handles pressing the High scores button*/
- (void) onScores: (CCMenuItemFont*) button;

@end
