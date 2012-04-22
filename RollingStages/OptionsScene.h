//
//  OptionsScene.h
//  RollingStages
//
//  Created by Amol Chaudhari on 2/25/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "CCScene.h"
#import "OptionsLayer.h"
#import "cocos2d.h"
@interface OptionsScene : CCScene
{
    OptionsLayer *optionsLayer;
}

-(IBAction)textFieldFinsished:(id)sender;
@end
