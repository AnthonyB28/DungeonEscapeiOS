//
//  ScoreBoard.h
//  DungeonEscape
//
//  Created by Marist User on 11/20/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ScoreBoard : NSObject

/* Set score if score is higher than any scoreboard value */
+ (void) setScore:(int)score;

/* Gets the leaderboards */
+(NSMutableArray*) getScores;

@end
