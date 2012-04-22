//
//  HealthBar.h
//  RollingStages
//
//  Created by Amol Chaudhari on 2/12/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCLayer.h"
#import "CCSprite.h"
#import "cocos2d.h"
#import "Box2D.h"
#import "LevelHelperLoader.h"

@interface HealthBar : CCLayer
{
    CCLayerColor *healthHiderLayer;
    BOOL isDead;
   
}
@property (nonatomic,retain)  CCLayerColor *healthHiderLayer;
@property (nonatomic,readwrite)      BOOL isDead;


-(void)setHealthPercent:(float)pct;
-(void)reduceHealthPercent:(float)pct;
-(void)healthBar;
-(void)reduceHealthHandler:(LHSprite *)_player;
@end
