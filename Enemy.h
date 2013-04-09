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
    int currentFrame;
    int framesToAnimate;
    NSString *theAction;
    int screenWidth;
    int screenHeight;
    float downwardSpeed;
}

+(id) createEnemy:(NSString*)baseImage;
-(id) initWithOwnProperties:(NSString*)baseImage;
-(int) width;
-(int) height;
- (CGRect) getSize;

@end
