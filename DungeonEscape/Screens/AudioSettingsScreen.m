//
//  AudioSettingsScreen.m
//  DungeonEscape
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "AudioSettingsScreen.h"
#import "SimpleAudioEngine.h"
#import "Options.h"
#define THEME_SONG @"bgm.mp3"

@implementation AudioSettingsScreen
+(CCScene *) scene
{
    CCScene* scene = [CCScene node];
    AudioSettingsScreen *layer = [AudioSettingsScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init
{
    if( (self=[super init]))
    {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        NSString* text = @"Audio Settings";
        
        // Label
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:34 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        // Color set
        [label setColor:ccc3(0, 0, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( screenWidth /2 , screenHeight * 0.65f );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        // Add the buttons
        CCMenuItem *muteButton =
        [CCMenuItemFont itemWithString:@"Mute" target:self selector:@selector(onMute:)];
        
        CCMenuItem *backButton =
        [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenu *menu = [CCMenu menuWithItems:muteButton, backButton, nil];
        
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

-(void) onMute: (CCMenuItemFont*) button
{
    if([Options soundsOn]) {
        [Options enableSounds:FALSE];
        
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
        [button setString:@"UnMute"];
    }
    else {
        [Options enableSounds:TRUE];
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:THEME_SONG loop:true];
         [button setString:@"Mute"];
    }
}

@end
