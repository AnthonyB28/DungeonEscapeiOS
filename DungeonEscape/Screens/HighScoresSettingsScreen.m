//
//  HighScoresSettingsScreen.m
//  DungeonEscape
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "HighScoresSettingsScreen.h"

@implementation HighScoresSettingsScreen
+(CCScene *) scene
{
    CCScene* scene = [CCScene node];
    HighScoresSettingsScreen *layer = [HighScoresSettingsScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init
{
    if( (self=[super init]))
    {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        NSString* text = @"High Scores Settings";
        
        // Label
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:34 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        // Color set
        [label setColor:ccc3(0, 0, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( screenWidth /2 , screenHeight * 0.65f );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        // Add the buttons
        CCMenuItem *scoreButton =
        [CCMenuItemFont itemWithString:@"Locally" target:self selector:@selector(onScoreChange:)];
        CCMenuItem *backButton =
        [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenu *menu = [CCMenu menuWithItems:scoreButton, backButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.25f)];
        
        [self addChild:menu];
    }
    
    return self;
}

-(void) onBack: (CCMenuItemFont*) button
{
    [[CCDirector sharedDirector] popScene];
}

-(void) onScoreChange: (CCMenuItemFont*) button
{
    // TODO change whether its online or not
}

@end
