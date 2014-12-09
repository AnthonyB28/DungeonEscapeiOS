//
//  HighScoreScreen.m
//  MyMagicalGameOfAwesomeProject
//
//  Created by Rob Whitaker on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "HighScoreScreen.h"
#import "ScoreBoard.h"

@implementation HighScoreScreen
+(CCScene *) scene {
	CCScene* scene = [CCScene node];
    
	HighScoreScreen *layer = [HighScoreScreen node];
	
	[scene addChild: layer];
    
	return scene;
}

- (id) init {
    if( (self=[super init])) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        // create and initialize a Label
        NSString* text = @"High score!";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:34 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
        
        [label setColor:ccc3(0, 255, 0)];
        
        // center label
        label.position =  ccp( screenWidth /2 , screenHeight * 0.65f );
        
        [self addChild: label];
        
        for(int i = 0; i < [ScoreBoard getScores].count; ++i)
        {
            int score = [[ScoreBoard getScores][i] intValue];
            NSMutableString* scoreText = [NSMutableString string];
            NSString* appendOne = [scoreText stringByAppendingFormat:@"%i", i+1];
            NSString* appendTwo = [appendOne stringByAppendingString:@") "];
            NSString* appendThree = [appendTwo stringByAppendingFormat:@"%i",score];
            CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:appendThree fontName:@"Marker Felt" fontSize:15 dimensions: CGSizeMake(400,100) hAlignment:UITextAlignmentCenter];
            
            [label setColor:ccc3(0, 255, 0)];
            
            // center label
            label.position =  ccp( screenWidth /2 , screenHeight/2 - (i*40) );
            
            [self addChild: label];
            
        }
        
        // Add the back button
        CCMenuItem *backButton =
        [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        //eventually add a text field for high score
        //UITextField *textField = [[UITextField  alloc] initWithFrame: CGRectMake(20, 50, 280, 30)];
        
        CCMenu *menu = [CCMenu menuWithItems:backButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.25f)];
        
        [self addChild:menu];
    }
    
    return self;
}

-(void)onBack:(CCMenuItemFont *)button {
    for(int i=0;i<3;i++) //pop all the way back to main menu... I hope
        [[CCDirector sharedDirector] popScene];
}
@end
