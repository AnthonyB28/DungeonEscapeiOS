//
//  GameOverScene.m
//  DungeonEscape
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "GameOverScreen.h"
#import "HighScoreScreen.h"

@implementation GameOverScreen
+(CCScene *) scene
{
    CCScene* scene = [CCScene node];
    GameOverScreen *layer = [GameOverScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init
{
    if( (self=[super init]))
    {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        NSString* text = @"Game Over";
        
        // Label
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:34 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        // Color set
        [label setColor:ccc3(0, 0, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( screenWidth /2 , screenHeight * 0.65f);
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        // Add the forward button
        CCMenuItem *forwardButton =
        [CCMenuItemFont itemWithString:@"High Scores" target:self selector:@selector(onForward:)];
        // Add the main menu button
        CCMenuItem *mainButton =
        [CCMenuItemFont itemWithString:@"Main Menu" target:self selector:@selector(onMain:)];
        
        CCMenu *menu = [CCMenu menuWithItems:forwardButton, mainButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.25f)];
        
        [self addChild:menu];
    }
    
    return self;
}

-(void) onForward: (CCMenuItemFont*) button
{
    // Go to high scores
    [[CCDirector sharedDirector] pushScene:[HighScoreScreen scene]];
}

-(void) onMain: (CCMenuItemFont*) button
{
    // Go to main menu
    for(int i=0;i<2;i++) //pop all the way back to main menu... I hope
        [[CCDirector sharedDirector] popScene];
}

@end
