//
//  Guillotine.m
//  DungeonEscape
//
//  Created by Marist User on 11/13/14.
//  Copyright 2014 Marist User. All rights reserved.
//

#import "Guillotine.h"

#define SPEED_DROP 4
#define SPEED_RISE -1

@implementation Guillotine
- (id) initAt:(CGPoint) here of:(AbstractLevel*) level_ {
    [super initWithFrames: @"harpie.png" width:32 andHeight:32];
    
    killable = false;
    
	state = STATE_ALIVE;
	
	xSpeed = 0;
	
	ySpeed = SPEED_DROP;
    
    [self collisionEvent];
	
	[self setPosition:here];
    
    level = level_;
	
	return self;
}

-(void) collisionEvent {
	if(ySpeed == SPEED_DROP)
        ySpeed = SPEED_RISE;
    else
        ySpeed = SPEED_DROP;
}
@end