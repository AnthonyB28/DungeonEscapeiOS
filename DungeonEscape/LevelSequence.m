//
//  LevelSequence.m
//  iMGABaseCC
//
//  Created by Ron Coleman on 12/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelSequence.h"
#import "Level0.h"
#import "Level1.h"
#import "level2.h"
#import "level3.h"

static NSMutableArray* levels;
static int levelno = 0;

@implementation LevelSequence
+ (void) initialize {
	levels =
        [[NSMutableArray alloc] initWithObjects:
         [Level2 class],
         [Level1 class],
         [Level0 class],
         [Level3 class],
         nil];
}

+ (Class) nextLevel {
	if(levelno >= [levels count])
		return nil;
	
	Class alevel = [levels objectAtIndex:levelno++];
    
	return alevel;
}

+ (void) setPrevLevel {
    levelno--;
}

+ (int) levelNumber {
	return levelno;
}

+ (int) numberOfLevels {
	return [levels count];
}

@end
