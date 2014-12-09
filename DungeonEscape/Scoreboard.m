//
//  ScoreBoard.m
//  DungeonEscape
//
//  Created by Marist User on 11/20/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "ScoreBoard.h"


@implementation ScoreBoard

+(void) setScore:(int)score{
    NSMutableArray* leaderboard = [self getScores];
    for(int i = 0; i < leaderboard.count; ++i)
    {
        int leaderScore = [leaderboard objectAtIndex:i];
        if(leaderScore < score)
        {
            leaderboard[i] = [NSNumber numberWithInt:score];
            return;
        }
    }
}

+(NSMutableArray*) getScores
{
    static NSMutableArray* theArray = nil;
    if (theArray == nil)
    {
        theArray = [[NSMutableArray alloc] init];
        [theArray addObject:[NSNumber numberWithInt:5]];
        [theArray addObject:[NSNumber numberWithInt:3]];
        [theArray addObject:[NSNumber numberWithInt:1]];
    }
    return theArray;
}


@end
