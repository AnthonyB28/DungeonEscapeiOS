//
//  Guillotine.h
//  DungeonEscape
//
//  Created by Marist User on 11/13/14.
//  Copyright 2014 Marist User. All rights reserved.
//

#import "Enemy.h"

@interface Spear : Enemy
{
    
}
/** Constructor */
- (id) initAt:(CGPoint) here of:(AbstractLevel*) level_ direction:(int) dir;

/** Handles a collision event */
- (void) collisionEvent;

- (void) moveOnCondition;

@end
