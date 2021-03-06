//
//  Guillotine.m
//  DungeonEscape
//
//  Created by Marist User on 11/13/14.
//  Copyright 2014 Marist User. All rights reserved.
//

#import "Spear.h"

@implementation Spear
- (id) initAt:(CGPoint) here of:(AbstractLevel*) level_ direction:(int) dir {
    [super initWithFrames: @"spear.png" width:32 andHeight:32];
    
	hitsTaken = 0;
    hitsToDie = -1;
	xSpeed = 30 * dir; // direction
	
	ySpeed = 0;
    
    //[self collisionEvent];
	if(dir < 0)
    {
        self.flipX = YES;
    }
    CGPoint spawnPos = ccp(here.x*2 + 20 * dir, here.y*2);
	[self setPosition:spawnPos];
    
    level = level_;
	
    state = STATE_ALIVE;
	return self;
}

-(void) moveOnCondition {
	[self moveTo: xSpeed and: ySpeed];
    
    if([level collidesWithProjectile:self])
    {
		[self collisionEvent];
    }
}


-(void) collisionEvent {
	[level removeChild:self cleanup:YES];
}
@end
