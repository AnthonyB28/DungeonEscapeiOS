//
//  HelloWorldLayer.h
//  DungeonEscape
//
//  Created by Marist User on 10/9/14.
//  Copyright Marist User 2014. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

/** Handles pressing pause button*/
- (void) onPause: (CCMenuItemFont*) button;

/** Handles pressing die button*/
- (void) onDie: (CCMenuItemFont*) button;

@end
