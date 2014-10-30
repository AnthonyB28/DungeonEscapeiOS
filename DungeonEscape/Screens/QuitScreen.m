//
//  QuitScreen.m
//  DungeonEscape
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "QuitScreen.h"

@implementation QuitScreen
+(CCScene *) scene
{
    CCScene* scene = [CCScene node];
    QuitScreen *layer = [QuitScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init
{
    if( (self=[super init]))
    {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        NSString* text = @"Quit?";
        
        // Label
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:34 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        // Color set
        [label setColor:ccc3(0, 0, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( screenWidth /2 , screenHeight * 0.65f );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        // Add the forward button
        CCMenuItem *quitButton =
        [CCMenuItemFont itemWithString:@"Yes" target:self selector:@selector(onQuit:)];
        CCMenuItem *backButton =
        [CCMenuItemFont itemWithString:@"No" target:self selector:@selector(onBack:)];
        
        CCMenu *menu = [CCMenu menuWithItems:quitButton, backButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.25f)];
        
        [self addChild:menu];
    }
    
    return self;
}

-(void) onQuit: (CCMenuItemFont*) button
{
    // Confirm quit
    exit(0);
}

-(void) onBack: (CCMenuItemFont*) button
{
    // Back to main menu
    [[CCDirector sharedDirector] popScene];
}

@end
