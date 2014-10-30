//
//  PauseScreen.h
//  MyMagicalGameOfAwesomeProject
//
//  Created by Rob Whitaker on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "cocos2d.h"

@interface PauseScreen : CCLayer
/** Gets a scene to contain this layer */
+(CCScene *) scene;

// Constructor
- (id) init;

- (void) onBackToGame: (CCMenuItemFont*) button;

- (void) onBackToMenu: (CCMenuItemFont*) button;

@end
