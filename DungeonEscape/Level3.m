//
//  Level3.m
//  iMGABaseCC
//
//  Created by Anthony Barranco on 11/9/14.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Level3.h"
#import "Helper.h"
#import "Gorgon.h"
#import "Harpie.h"
#import "SoundEffects.h"
#import "Spear.h"
int RID_SPEAR = 56;
#define REWARD_CRUSH_MONSTA 20

@implementation Level3

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	Level3 *layer = [Level3 node];
	
	// add layer as a child to scene
	[scene addChild: layer z:25];
    
    [scene addChild: [GameController make] z:25];
    
	return scene;
}

- (id) init {
    if([self isMemberOfClass:[Level3 class]])
        world = [CCTMXTiledMap tiledMapWithTMXFile:@"dungeonescape_level3.tmx"];
    
    if((self = [super init])) {
        bubbles = [[NSArray alloc]initWithObjects:
                   @"Caught!",@"Gotcha!",@"Take that!",@"Pow!",@"Ha, ha!",nil];
        
        feedback = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:24];
        
        hasWeapon = false;
        hasGoldKey = false;
        hasRedKey = false;
        hasGreenKey = false;
        fireWeapon = false;
        redTeleLocation = ccp(600,200);
        redTeleLocationBack = ccp(500,200);
        blueTeleLocation = ccp(60, 400);
        blueTeleLocationBack = ccp(750, 200);
        greenTeleLocation = ccp(160,200);
        greenTeleLocationBack = ccp(60,30);
        
        [feedback setVisible:FALSE];
        
        [feedback setColor:ccc3(0,0,0)];
        
        [feedback setAnchorPoint:ccp(0,0)];
        
        // Standard method to create a button
        CCMenuItem *shootButtonItem = [CCMenuItemImage
                                       itemWithNormalImage:@"harpie.png"
                                       selectedImage:@"harpie.png"
                                    target:self selector:@selector(shootButtonTapped:)];
        shootButtonItem.position = ccp(60, 60);
        CCMenu *starMenu = [CCMenu menuWithItems:shootButtonItem, nil];
        starMenu.position = CGPointZero;
        [self addChild:starMenu];
        
        // If you forget to add the feedback to the world and try to position
        // it later, cocos2d crashes
        [self addChild:feedback z:95];
    }
    
	return self;
}

- (void) initWorld {
    [super initWorld];
    projectiles = [[NSMutableArray alloc] init];
    weaponLayer = [world layerNamed:@"weapons"];
}

-(void) update:(ccTime)dt {
    if(caught || complete)
        return;
  
    if([grace collidesWith: weaponLayer]) {
        [self handleWeaponPickupCollision];
    }
    
    if(hasWeapon && fireWeapon)
    {
        [self spawnSpear];
        fireWeapon = false;
    }
    
    Spear* projectileToRemove = nil;
    for(Spear* projectile in projectiles) {
        [projectile update];
        if(projectile.state == STATE_DEAD)
        {
            projectileToRemove = projectile;
        }
    }
    if(projectileToRemove != nil)
    {
        [projectiles removeObject:projectileToRemove];
    }
    
    [super update:dt];
    
}

-(void) spawnSpear {
    int direction = 0;
    if(grace.frameNumber == 0) // LEFT
    {
        direction = -1;
    }
    else if(grace.frameNumber == 2) // RIGHT
    {
        direction = 1;
    }
    
    Spear* projectile = (Spear*) [[Spear alloc] initAt:grace.position of:self direction:direction];
    
    [self addChild:projectile z:90];
    
    [projectiles addObject:projectile];
}

- (void) handleWeaponPickupCollision {
	int x = grace.x;
	int y = grace.y;
    
    //    CGPoint contact = [Helper worldToTileX:x andY:y];
    CGPoint contact = [Helper world:world toTile:ccp(x,y)];
	
	int gid = [weaponLayer tileGIDAt:contact];
	
	if(gid == 0) {
		x += world.tileSize.width;
		
        //		contact = [Helper worldToTileX:x andY:y];
        contact = [Helper world:world toTile:ccp(x,y)];
		
		gid = [weaponLayer tileGIDAt:contact];
	}
    
    if([self isWeaponPickup:gid])
    {
        // Do weapon stuff
        hasWeapon = true;
        [weaponLayer removeTileAt:contact];
    }
}

- (bool) collidesWithProjectile: (id) projectile {
    // Check for collision with a block or platform
    Enemy* projectileEnemy = (Enemy*)projectile;
    
    CGRect projectileRect = CGRectMake(projectileEnemy.x, projectileEnemy.y, projectileEnemy.width,projectileEnemy.height);
    
    for(Enemy* enemy in enemies)
    {
        if(enemy.state == STATE_ALIVE)
        {
            CGRect other = CGRectMake(enemy.x, enemy.y, enemy.width, enemy.height);
            bool collided = CGRectIntersectsRect(projectileRect, other);
            if(collided && enemy.hitsToDie != -1)
            {
                enemy.hitsTaken += 1;
                if(enemy.hitsTaken >= enemy.hitsToDie)
                {
                    enemy.state = STATE_DYING;
                    [Score increment:REWARD_CRUSH_MONSTA];
                    [SoundEffects yeah];
                    projectileEnemy.state = STATE_DEAD;
                }
                return true;
            }
        }
    }
    
    return false;
}

- (void) shootButtonTapped:(id)sender {
    fireWeapon = true;
}

-(bool) isWeaponPickup:(int)gid{
    if(gid == RID_SPEAR)
    {
        return true;
    }
    
    return false;
}

@end
