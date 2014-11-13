//
//  Guillotine.h
//  DungeonEscape
//
//  Created by Marist User on 11/13/14.
//  Copyright 2014 Marist User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Enemy.h"

@interface Guillotine : Enemy
/** Constructor */
- (id) initAt:(CGPoint) here of:(AbstractLevel*) level_;

/** Handles a collision event */
- (void) collisionEvent;
@end
