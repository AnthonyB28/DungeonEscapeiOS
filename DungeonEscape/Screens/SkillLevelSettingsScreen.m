//
//  SkillLevelSettingsScreen.m
//  DungeonEscape
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "SkillLevelSettingsScreen.h"
#import "Lives.h"

@implementation SkillLevelSettingsScreen
+(CCScene *) scene
{
    CCScene* scene = [CCScene node];
    SkillLevelSettingsScreen *layer = [SkillLevelSettingsScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init
{
    if( (self=[super init]))
    {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        NSString* text = @"Skill Level Settings";
        
        // Label
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:34 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        // Color set
        [label setColor:ccc3(0, 0, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( screenWidth /2 , screenHeight * 0.65f);
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        NSString* helpText = @"Easy = 3 lives\nMedium = 2 lives\nHard = 1 life";
        // Label
        CCLabelTTF *helpLabel = (CCLabelTTF*)[CCLabelTTF labelWithString:helpText fontName:@"Marker Felt" fontSize:15 dimensions: CGSizeMake(400,200) hAlignment:UITextAlignmentCenter];
        
        // Color set
        [helpLabel setColor:ccc3(0, 0, 255)];
        
        // position the label on the center of the screen
        helpLabel.position =  ccp( screenWidth /2 , screenHeight * 0.35f);
        
        // add the label as a child to this Layer
        [self addChild: helpLabel];
        
        // Add the button
        CCMenuItem *easyButton =
        [CCMenuItemFont itemWithString:@"Easy" target:self selector:@selector(onEasy:)];
        CCMenuItem *mediumButton =
        [CCMenuItemFont itemWithString:@"Medium" target:self selector:@selector(onMedium:)];
        CCMenuItem *hardButton =
        [CCMenuItemFont itemWithString:@"Hard" target:self selector:@selector(onHard:)];
        CCMenuItem *backButton =
        [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenu *menu = [CCMenu menuWithItems:easyButton, mediumButton, hardButton, backButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.25f)];
        
        [self addChild:menu];
    }
    
    return self;
}

-(void) onEasy: (CCMenuItemFont*) button
{
    [Lives set:3];
}

-(void) onMedium: (CCMenuItemFont*) button
{
    [Lives set:2];
}

-(void) onHard: (CCMenuItemFont*) button
{
    [Lives set:1];
}

-(void) onBack: (CCMenuItemFont*) button
{
    [[CCDirector sharedDirector] popScene];
}

@end

