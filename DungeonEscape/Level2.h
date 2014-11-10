//
//  Level2.h
//  iMGABaseCC
//

#import "Level1.h"

/** Level 1 handles enemies */
@interface Level2 : Level1 {
    CCTMXLayer* obstaclesLayer;
}

/** Gets a scene for this layer */
+ (CCScene *) scene;

/** Constructor */
- (id) init;

/** Initializes the world */
- (void) initWorld;

/** Updates the level */
- (void) update:(ccTime)dt;

@end
