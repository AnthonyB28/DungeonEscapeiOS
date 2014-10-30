//
//  OptionsScreen.m
//  DungeonEscape
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "OptionsScreen.h"
#import "AudioSettingsScreen.h"
#import "HighScoresSettingsScreen.h"
#import "SkillLevelSettingsScreen.h"

@implementation OptionsScreen

+(CCScene *) scene
{
    CCScene* scene = [CCScene node];
    OptionsScreen *layer = [OptionsScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init
{
    if( (self=[super init]))
    {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        NSString* text = @"Options";
        
        // Label
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:34 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        // Color set
        [label setColor:ccc3(0, 0, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( screenWidth /2 , screenHeight * 0.65f );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        // Add the buttons
        CCMenuItem *backButton =
        [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenuItem *audioButton =
        [CCMenuItemFont itemWithString:@"Audio Settings" target:self selector:@selector(onAudio:)];
        
        CCMenuItem *skillButton =
        [CCMenuItemFont itemWithString:@"Skill Level" target:self selector:@selector(onSkill:)];

        CCMenuItem *scoresButton =
        [CCMenuItemFont itemWithString:@"High Scores" target:self selector:@selector(onScores:)];
        
        CCMenu *menu = [CCMenu menuWithItems: audioButton, skillButton, scoresButton, backButton, nil];
        
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

-(void)onAudio:(CCMenuItemFont *)button
{
    [[CCDirector sharedDirector] pushScene:[AudioSettingsScreen scene]];
}

-(void)onSkill:(CCMenuItemFont *)button
{
    [[CCDirector sharedDirector] pushScene:[SkillLevelSettingsScreen scene]];
}

-(void)onScores:(CCMenuItemFont *)button
{
    [[CCDirector sharedDirector] pushScene:[HighScoresSettingsScreen scene]];
}


@end
