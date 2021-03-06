//
//  MainScreen.m
//  DungeonEscape
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "MainScreen.h"
#import "OptionsScreen.h"
#import "QuitScreen.h"
#import "HelloWorldLayer.h"
#import "InterLevel.h"
#import "Options.h"
#import "SimpleAudioEngine.h"
#define THEME_SONG @"bgm.mp3"

@implementation MainScreen
+(CCScene *) scene
{
    CCScene* scene = [CCScene node];
    MainScreen *layer = [MainScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init
{
    if( (self=[super init]))
    {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        NSString* text = @"Dungeon Escape";
        
        // Label
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:34 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        // Color set
        [label setColor:ccc3(0, 0, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( screenWidth /2 , screenHeight * 0.65f );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        // Add the forward button
        CCMenuItem *newButton =
        [CCMenuItemFont itemWithString:@"New Game" target:self selector:@selector(onNew:)];
        
        if(false) // if we want the resume game button
        {
            /*CCMenuItem *resumeButton =
             [CCMenuItemFont itemWithString:@"Resume Game" target:self selector:@selector(onResume:)];*/
        }
        
        CCMenuItem *optionsButton =
        [CCMenuItemFont itemWithString:@"Options" target:self selector:@selector(onOptions:)];
        CCMenuItem *quitButton =
        [CCMenuItemFont itemWithString:@"Quit" target:self selector:@selector(onQuit:)];
        
        CCMenu *menu = [CCMenu menuWithItems:newButton, optionsButton, quitButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.25f)];
        
        // Set music on by default
        [Options enableMusic:true];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:THEME_SONG loop:true];
        
        [self initLogo];
        [self addChild:menu];
    }
    
    return self;
}

- (void) initLogo {
    CCTexture2D* texture = [[CCTextureCache sharedTextureCache] addImage:@"logo.png"];
    
    CCSpriteFrame *frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(0, 0, 82, 85)];
    
    CCSprite* logo = [CCSprite node];
    
    [logo setDisplayFrame: frame];
    int screenWidth = [[CCDirector sharedDirector] winSize].width;
    int screenHeight = [[CCDirector sharedDirector] winSize].height;
    
    logo.position = ccp(screenWidth * 0.25, screenHeight* 0.85);
    
    logo.scale = 1.0;
    
    [self addChild:logo];
}

-(void) onNew: (CCMenuItemFont*) button
{
    // Go to game screen
    [[CCDirector sharedDirector] pushScene:[HelloWorldLayer scene]];
    [[CCDirector sharedDirector] pushScene:[InterLevel scene]];
}

-(void) onResume: (CCMenuItemFont*) button
{
    // TODO Resume game
    //[[CCDirector sharedDirector] pushScene:(CCScene *)];
}

-(void) onOptions: (CCMenuItemFont*) button
{
    // Go to options screen
    [[CCDirector sharedDirector] pushScene:[OptionsScreen scene]];
}

-(void) onQuit: (CCMenuItemFont*) button
{
    // Go to the quit confirm screen
    [[CCDirector sharedDirector] pushScene:[QuitScreen scene]];
}


@end

