//
//  Level3.h
//  iMGABaseCC
//

#import "Level2.h"

@interface Level3 : Level2 {
    bool hasWeapon;
    bool fireWeapon;
    CCTMXLayer* weaponLayer;
    NSMutableArray* projectiles;
}

/** Gets a scene for this layer */
+ (CCScene *) scene;

/** Constructor */
- (id) init;

/** Initializes the world */
- (void) initWorld;

/** Updates the level */
- (void) update:(ccTime)dt;

-(void) handleWeaponPickupCollision;

-(bool) isWeaponPickup:(int)gid;

-(bool) collidesWithProjectile:(id)projectile;

-(void) shootButtonTapped:(id)sender;
@end
