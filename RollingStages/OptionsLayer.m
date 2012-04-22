//
//  OptionsLayer.m
//  RollingStages
//
//  Created by Amol Chaudhari on 2/25/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "OptionsLayer.h"
#import "CCTextField.h"
#import "GameManager.h"
#import "DatabaseCalls.h"

@implementation OptionsLayer
@synthesize myTextField;




-(void)playScene:(CCMenuItemFont*)itemPassedIn
{
    
    /*
     The playScene method launches the GameplayScene depending on which of the  levels the player has selected
     */
    if (itemPassedIn.tag==1) {
        CCLOG(@"Change Player Name  selected from Options Menu");
    }
    else if(itemPassedIn.tag==2)
    {
        CCLOG(@"Sound on off in options menu");
    }
    else if(itemPassedIn.tag==3)
    {
        [[GameManager sharedGameManager]runSceneWithID:kMainMenuScene];
        
      //  DatabaseCalls *dbCalls = [[DatabaseCalls alloc]init];
        
        //[dbCalls insertData:myTextField.text];
        //[dbCalls release];
        
        [myTextField removeFromSuperview];
        CCLOG(@"Go back to Main Menu");

    }
    
    
    
}




-(void)displayOptionsMenu
{
    /*
     
     Using fontfile to display 
     
     */
    
    CGSize screenSize = [CCDirector sharedDirector].winSize; 
    
    
    CCLabelBMFont *changePlayerNameLabel = [CCLabelBMFont labelWithString:@"Change Player Name" fntFile:@"RollingStagesfnt.fnt"];
    CCMenuItemLabel *changePlayerNameButton = [CCMenuItemLabel itemWithLabel:changePlayerNameLabel target:self selector:@selector(playScene:)];
    [changePlayerNameButton setTag:1];
    
    //Options start
    
    CCLabelBMFont *soundOnOffLabel = [CCLabelBMFont labelWithString:@"Sound ON" fntFile:@"RollingStagesfnt.fnt"];
    CCMenuItemLabel *soundOnOffButton = [CCMenuItemLabel itemWithLabel:soundOnOffLabel target:self selector:@selector(playScene:)];
    [soundOnOffButton setTag:2];
    
    
    
    CCLabelBMFont *backButtonLabel = [CCLabelBMFont labelWithString:@"Back" fntFile:@"RollingStagesfnt.fnt"];
    CCMenuItemLabel *backButton = [CCMenuItemLabel itemWithLabel:backButtonLabel target:self selector:@selector(playScene:)];
    [backButton setTag:3];
    
    //end
    
    
    
    
    CCMenu *optionsMenu = [CCMenu menuWithItems:changePlayerNameButton,soundOnOffButton,backButton, nil];
    [optionsMenu alignItemsVerticallyWithPadding:60.0f];
    [optionsMenu setPosition:ccp(screenSize.width * 0.75f, screenSize.height/2)];
    [self addChild:optionsMenu];
    
}


-(void)createTextField
{
    
   myTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 20, 200, 32)];
   // [textField setReturnKeyType:UIReturnKeyDone];
    
   // [textField addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    myTextField.keyboardType = UIKeyboardTypeDefault;
    myTextField.returnKeyType = UIReturnKeyDone;
    myTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    myTextField.delegate=self;
    myTextField.userInteractionEnabled=YES;
    [myTextField becomeFirstResponder];
    
    myTextField.backgroundColor=[UIColor whiteColor];
    myTextField.textColor = [UIColor redColor]  ;
    myTextField.borderStyle=UITextBorderStyleBezel;
    
    [[[CCDirector sharedDirector]openGLView]addSubview:myTextField];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField==myTextField){
        [myTextField endEditing:YES];
        
        //result = myTextField.text;
        //[label setString:result];
        //[myTextField removeFromSuperview];
    }
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        [self displayOptionsMenu];
        [self createTextField];
     //   DatabaseCalls *dbCalls = [[DatabaseCalls alloc]init];
       // [dbCalls fetchPlayerName];
        //[dbCalls release];
    }
    
    return self;
}




@end
