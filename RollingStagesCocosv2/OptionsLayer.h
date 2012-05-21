//
//  OptionsLayer.h
//  RollingStages
//
//  Created by Amol Chaudhari on 2/25/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"




@interface OptionsLayer : CCLayer<UITextFieldDelegate>
{
    UITextField *myTextField;
}

@property (nonatomic,retain,readwrite)IBOutlet     UITextField *myTextField;

@end
