//
//  MainGame.m
//  TargetPeactice
//
//  Created by Ezra Paulekas on 4/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MainGameLayer.h"
#import "Constants.h"

#define IS_IPHONE (!IS_IPAD)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)

@implementation MainGameLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainGameLayer *layer = [MainGameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}




// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
        
//        [[CCDirector sharedDirector] setD];
        self.isTouchEnabled = true;
        
        moveVar = 3;
        
        ammoKindInUse = kDefaultAmmo;
        ammoKindToPickUp = kDefaultAmmo;
        
        
        
        sae = [SimpleAudioEngine sharedEngine];
        
        screenWidth = [[CCDirector sharedDirector] winSize].width;
        screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        if(IS_IPAD) {
            CCLOG(@"is ipad");
            areWeOnTheIpad = YES;
        }
        else if(IS_IPHONE)  {
            CCLOG(@"is iphone");
            areWeOnTheIpad = NO;
        }
        
        // sweet shorthand dude
        //areWeOnTheIpad = (screenWidth == 768) ? YES : NO;
        
        theBackground = [CCSprite spriteWithFile:@"background.png"];
        theBackground.position = ccp(screenWidth/2, screenHeight/2);
        [self addChild:theBackground z:-10];
        
        scoreLabel = [CCLabelBMFont labelWithString:@"0" fntFile:@"pxl.fnt"];
        scoreLabel.position = ccp(screenWidth *.9, 20);
        [self addChild:scoreLabel z:100];
        
        thePlayer = [Player createPlayer:@"dude"];
        [self addChild:thePlayer z:10];
        thePlayer.position = ccp(screenWidth / 2, thePlayer.height);
        
        [self schedule:@selector(automaticFire:) interval:60.0f / 60.0f];
        [self schedule:@selector(mainGameLoop:) interval:1.0f / 60.0f];
	}
	return self;
}




-(void) mainGameLoop:(ccTime)delta    {

}




-(void) addToScore:(int) amountToAdd    {
    score += amountToAdd;
    
    NSString *scoreString = [NSString stringWithFormat:@"%i", score];
    [scoreLabel setString:scoreString];
}




-(void) automaticFire:(ccTime)delta      {
    
    [thePlayer setupFireAnimation];
    
    if(ammoKindInUse == kDefaultAmmo)   {
        ammoTypeStringName = @"round";
    }
    else if(ammoKindInUse == kLaserAmmo){
        ammoTypeStringName = @"laser";
    }
    else if(ammoKindInUse == kShotGunAmmo){
        ammoTypeStringName = @"shotgun";
    }
    else if(ammoKindInUse == kNinjaStarAmmo)    {
        ammoTypeStringName = @"ninja";
    }
    
    Bullet *theBullet = [Bullet createBullet:ammoTypeStringName];
    [self addChild:theBullet z:1];
    theBullet.position = ccp(thePlayer.position.x, thePlayer.position.y + thePlayer.height);
    
    [sae playEffect:@"gunshot.caf"];
    [self schedule:@selector(playShellSound:) interval:0.2];
    
}




-(void) playShellSound:(ccTime) delta   {
    [sae playEffect:@"shell_drop.caf"];
    [self unschedule:_cmd];
}




-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event  {
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    thePlayer.position = ccp(location.x, thePlayer.position.y);
}




-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event  {
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    thePlayer.position = ccp(location.x, thePlayer.position.y);
    
}




// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
