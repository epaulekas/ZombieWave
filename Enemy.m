    //
//  Enemy.m
//  TargetPractice
//
//  Created by Ezra Paulekas on 4/6/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Enemy.h"


@implementation Enemy

+(id) createEnemy:(NSString *)baseImage {
    return [[[self alloc] initWithOwnProperties:(NSString*)baseImage] autorelease];
}

-(id) initWithOwnProperties:(NSString *)baseImage   {
    
    if((self = [super init]))   {
        theBaseImage = baseImage;
        enemySprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@.png", baseImage]];
        [self addChild:enemySprite];
        enemySprite.position = ccp(0, 0);
        
//        [self setupDefaultAnimation];
//        [self schedule:@selector(runEnemyAnimationSequence:) interval:1.0f/60.0f];
    }
    return self;
}

@end
