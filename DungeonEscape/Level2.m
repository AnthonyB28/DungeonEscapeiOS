//
//  Level2.m
//  iMGABaseCC
//
//  Created by Anthony Barranco on 11/9/14.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Level2.h"
#import "Helper.h"
#import "Gorgon.h"
#import "Harpie.h"
#import "SoundEffects.h"

@implementation Level2

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	Level2 *layer = [Level2 node];
	
	// add layer as a child to scene
	[scene addChild: layer z:25];
    
    [scene addChild: [GameController make] z:25];
    
	return scene;
}

- (id) init {
    if([self isMemberOfClass:[Level2 class]])
        world = [CCTMXTiledMap tiledMapWithTMXFile:@"dungeonescape_level2.tmx"];
    
    if((self = [super init])) {
        bubbles = [[NSArray alloc]initWithObjects:
                   @"Caught!",@"Gotcha!",@"Take that!",@"Pow!",@"Ha, ha!",nil];
        
        feedback = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:24];
        
        hasGoldKey = false;
        hasRedKey = false;
        hasGreenKey = false;
        redTeleLocation = ccp(600,200);
        redTeleLocationBack = ccp(500,200);
        blueTeleLocation = ccp(60, 400);
        blueTeleLocationBack = ccp(750, 200);
        greenTeleLocation = ccp(160,200);
        greenTeleLocationBack = ccp(60,30);
        
        [feedback setVisible:FALSE];
        
        [feedback setColor:ccc3(0,0,0)];
        
        [feedback setAnchorPoint:ccp(0,0)];
        
        // If you forget to add the feedback to the world and try to position
        // it later, cocos2d crashes
        [self addChild:feedback z:95];
    }
    
	return self;
}

- (void) initWorld {
    [super initWorld];
    
    stalksLayer = [world layerNamed:@"stalks"];
    obstaclesLayer = [world layerNamed:@"obstacles"];
}

-(void) update:(ccTime)dt {
    if(caught || complete)
        return;
    
    [super update:dt];
    
    // Hit spikes or swings, technically "caught"
    if([grace collidesWith: obstaclesLayer]) {
        caught = true;
    }
}

@end
