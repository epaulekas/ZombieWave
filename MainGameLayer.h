//
//  MainGame.h
//  TargetPractice
//
//  Created by Ezra Paulekas on 4/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#import "Bullet.h"
#import "Enemy.h"
#import "SimpleAudioEngine.h"

@interface MainGameLayer : CCLayer {
    
    // custon classes
    Player *thePlayer;
    
    // CCSprites
    CCSprite *theBackground;
    
    // lebels
    CCLabelBMFont *scoreLabel;
    int score;
    
    // media
    SimpleAudioEngine *sae;
    
    // floats
    float bulletRatio;
    
    // bools
    BOOL areWeOnTheIpad;
    
    // chars
    signed char moveVar;    // range of -128 to 128
//  unsigned char moveVar;  // range of 0 to 255
    
    // ints
    int screenWidth;
    int screenHeight;
    
    int ammoKindInUse;
    int ammoKindToPickUp;
    
    int numberOfEnemiesOnStage;
    int maxNumberOfEnemies;
    
    //NSStrings
    NSString *ammoTypeStringName;
    
    // CGPoints
    CGPoint whereTheEnemyGotShot;

}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(void) addToScore:(int) amountToAdd;
-(void) enemyAndBulletCollisionHandler;

@end
