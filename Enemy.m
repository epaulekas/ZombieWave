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
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        screenWidth = screenSize.width;
        screenHeight = screenSize.height;
        
        downwardSpeed = .002 * screenHeight;
        
        theBaseImage = baseImage;
        enemySprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@.png", baseImage]];
        [self addChild:enemySprite];
        enemySprite.position = ccp(0, 0);
        
        [self setupDefaultAnimation];
        
        [self schedule:@selector(runEnemyAnimationSequence:) interval:1.0f/60.0f];
    }
    return self;
}



-(int)width {
    return enemySprite.contentSize.height;
}



-(int)height    {
    return enemySprite.contentSize.width;
}



-(void) setupDefaultAnimation   {
    currentFrame = 0;
    framesToAnimate = 31;
    theAction = @"crawl";
}



-(void) makeEnemyGoLower    {
    self.position = ccp(self.position.x, self.position.y - downwardSpeed);
}



-(void) runEnemyAnimationSequence:(ccTime) delta   {
    // increment frame
    currentFrame++;
    
    [self makeEnemyGoLower];
    
    // add leading zeros
    NSString *frameString = [NSString stringWithFormat:@"%i", currentFrame];
    
    while(frameString.length < 4)   {
        frameString = [NSString stringWithFormat:@"0%@",frameString];
    }
    
    // retexture the sprite
    [enemySprite setTexture:[[CCSprite spriteWithFile:[NSString stringWithFormat:@"%@_%@%@.png", theBaseImage, theAction, frameString]] texture]];
    
    // at end of sequence reset to default action
    if(currentFrame == framesToAnimate) {
        [self setupDefaultAnimation];
    }
}



@end
