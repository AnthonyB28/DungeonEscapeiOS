//
//  PauseScreen.m
//  MyMagicalGameOfAwesomeProject
//
//  Created by Rob Whitaker on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "PauseScreen.h"

@implementation PauseScreen
+(CCScene *) scene {
	CCScene* scene = [CCScene node];
    
	PauseScreen *layer = [PauseScreen node];
	
	[scene addChild: layer];
    
	return scene;
}

- (id) init {
    if( (self=[super init])) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        // create and initialize a Label
        NSString* text = @"Paused";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:34 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        [label setColor:ccc3(0, 255, 0)];
        
        // center label
        label.position =  ccp( screenWidth /2 , screenHeight * 0.65f );
        
        [self addChild: label];
        
        // Add the back button
        CCMenuItem* resumeButton =
        [CCMenuItemFont itemWithString:@"Resume" target:self selector:@selector(onBackToGame:)];
        
        CCMenuItem* backToMenuButton =
        [CCMenuItemFont itemWithString:@"Quit To Main Menu" target:self selector:@selector(onBackToMenu:)];

        
        CCMenu *menu = [CCMenu menuWithItems:resumeButton, backToMenuButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.25f)];
        
        [self addChild:menu];
    }
    
    return self;
}

-(void)onBackToMenu:(CCMenuItemFont *)button {
    for(int i=0;i<2;i++) //pop all the way back to main menu... I hope
        [[CCDirector sharedDirector] popScene];
}

-(void)onBackToGame:(CCMenuItemFont *)button {
    [[CCDirector sharedDirector] popScene];
}

@end
