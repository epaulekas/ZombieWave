//
//  Enemy.h
//  TargetPractice
//
//  Created by Ezra Paulekas on 4/6/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Enemy : CCNode {
    NSString *theBaseImage;
    CCSprite *enemySprite;
}

+(id) createEnemy:(NSString*)baseImage;
-(id) initWithOwnProperties:(NSString*)baseImage;

@end
