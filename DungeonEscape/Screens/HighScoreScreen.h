//
//  HighScoreScreen.h
//  MyMagicalGameOfAwesomeProject
//
//  Created by Rob Whitaker on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "cocos2d.h"

@interface HighScoreScreen : CCLayer
/** Gets a scene to contain this layer */
+(CCScene *) scene;

// Constructor
- (id) init;

/** Handles pressing the back button */
- (void) onBack: (CCMenuItemFont*) button;
@end
