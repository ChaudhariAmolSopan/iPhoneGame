//
//  LevelSelectLayer.h
//  RollingStages
//
//  Created by Amol Chaudhari on 5/15/12.
//  Copyright (c) 2012 nyu-poly. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "LevelHelperLoader.h"
#import "Constants.h"
#import "GameManager.h"

@interface LevelSelectLayer : CCLayer
{
    LevelHelperLoader *_lhelper;

    CCLabelTTF *_label;
}


@end
