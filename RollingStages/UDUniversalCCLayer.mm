//
//  UDUniversalCCLayer.m
//  RollingStages
//
//  Created by Amol Chaudhari on 2/27/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "UDUniversalCCLayer.h"

@implementation UDUniversalCCLayer



-(void)setUpWorld
{
    b2Vec2 gravity = b2Vec2(0.0f,0.0f);
    _world = new b2World(b2Vec2(0, 0)); 
    
    
    
    
}

-(void)setUpLevelHelperWithStageFileName:(NSString *)stageFileName playerName:(NSString*)playerName
{
    
    _lhelper = [[LevelHelperLoader alloc] initWithContentOfFile:stageFileName];
    [_lhelper addObjectsToWorld:_world cocos2dLayer:self];
    // [lh createPhysicBoundaries:world];
    [_lhelper createGravity:_world];
    
    
    
    _player = [_lhelper spriteWithUniqueName:playerName];
    NSAssert(_player != nil, @"Couldnt find player");
    
    
    
    
}

-(void)createGround
{
    
    [_lhelper createPhysicBoundaries:_world];
    
    
}

- (void)updateBox2D:(ccTime)dt {
    
    
    int32 velocityIterations = 3;
    int32 positionIterations = 2;
    
    
    _world->Step(dt, velocityIterations, positionIterations);
    //_world->ClearForces();
}

- (void)updateSprites:(ccTime)dt {
    
    
    //Updating sprites very important method
    for (b2Body* b = _world->GetBodyList(); b; b = b->GetNext())
    {
        if (b->GetUserData() != NULL) 
        {
            CCSprite *myActor = (CCSprite*)b->GetUserData();            
            if(myActor != 0)
            {
                //THIS IS VERY IMPORTANT - GETTING THE POSITION FROM BOX2D TO COCOS2D
                myActor.position = [LevelHelperLoader metersToPoints:b->GetPosition()];
                
                myActor.rotation = -1 * CC_RADIANS_TO_DEGREES(b->GetAngle());      
            }            
        }   
    } 
}

- (void)update:(ccTime)dt {
    [self updateBox2D:dt];
    [self updateSprites:dt];
    [healthBar reduceHealthHandler:_player];
 
    CCLOG(@"%f",healthBar.healthHiderLayer.scaleX);
    
    if (healthBar.isDead == YES) {
        [self winLost];
        [self unscheduleUpdate];
    }

    
    [self UDRevoluteJointsMethodsImplementation];
}

-(void)UDRevoluteJointsMethodsImplementation
{
    CCLOG(@"Override this -(void)UDRevoluteJointsMethodsImplementation inside UDUniversalCCLayer");
}



-(id)initWithPlayerSpriteName:(NSString *)playerName stageFileName:(NSString*)stageFileName
{
    
    
    self = [super init];
    if (self) {
        // Initialization code here.
        [self setUpWorld];
        [self setUpLevelHelperWithStageFileName:stageFileName playerName:playerName];
        [self createGround];
        [self scheduleUpdate];
        
        ContactListener *contactListener = new ContactListener();
        _world->SetContactListener(contactListener);

        
        
        self.isAccelerometerEnabled=TRUE;
        //_player.body->SetGravityScale(2.0);
      //  isContactMade=NO;
        self.isTouchEnabled=YES;
        appDelegate = 	 (AppDelegate *)[[UIApplication sharedApplication] delegate];

        healthBar= [[HealthBar alloc]init];
        [self addChild:healthBar];
        
    }
    
    return self;

}



-(void)registerWithTouchDispatcher
{
    [[CCTouchDispatcher sharedDispatcher]addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
    
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}
-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (appDelegate.hasPlayerMadeContact==YES) {
        appDelegate.hasPlayerMadeContact=NO;
        
    }
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    //This simply converts the accelerometer input to a gravity vector. It multiplies the accelerometer result (which typically ranges between −1 and 1) by 15, in order to get a nice feel for gravity in the level. Since Space Viking is set up to run in landscape mode (and accelerometer data is given in portrait orientation), it reverses the x and y coordi- nates and f lips the sign of the y coordinate to get the proper vector.
    b2Vec2 gravity (-acceleration.y * 50,acceleration.x * 50);
    
    
    
    if ( appDelegate.detectCollisionToReduceHealth) {
        
        appDelegate.detectCollisionToReduceHealth=NO;
    }
    
    if (appDelegate.hasPlayerMadeContact) {
        
        b2Vec2 gravity (-acceleration.y * 30,acceleration.x * 30);
        
        _world ->SetGravity(gravity);
        
        
    }
    else
    {
        _player.body->SetLinearVelocity(gravity);
    }
    
    
}




-(void)winLostComplete:(id)sender
{
  //  [[GameManager sharedGameManager]setHasPlayerDied:NO];
    CCLOG(@"Inside win complete");
    [[GameManager sharedGameManager]runSceneWithID:kMainMenuScene];
}


-(void)winLost
{
    CGSize winSize = [[CCDirector sharedDirector]winSize];
    CCLabelTTF *label;
    if (healthBar.isDead) { //To see if health gone ZERO
        label = [CCLabelTTF labelWithString:@"You Loose !!!" fontName:@"Helvetica" fontSize:48.0];
        
        
    }
    else
    {
        
        label = [CCLabelTTF labelWithString:@"You Win !!! :( " fontName:@"Helvetica" fontSize:48.0];
    }
    label.position = ccp(winSize.width/2, winSize.height/2);
    label.scale=0.25;
    
    //This uses a set of CCActions (which you learned about in Chapter 5) to animate a label (which you learned about in Chapter 6) to zoom in and out, wait a bit, then transition to the level complete scene.
    
    [self addChild:label];
    
    CCScaleTo *scaleUp = [CCScaleTo actionWithDuration:1.0 scale:1.0];
    CCScaleTo *scaleBack = [CCScaleTo actionWithDuration:1.0 scale:1.0];
    CCDelayTime *delay = [CCDelayTime actionWithDuration:2.0];
    CCCallFunc *winLostComplete = [CCCallFunc actionWithTarget:self selector:@selector(winLostComplete:)];
    CCSequence *sequence = [CCSequence actions:scaleUp,scaleBack,delay,winLostComplete,nil];
    
    [label runAction:sequence];
    
}





/*
- (id)init
{
 
}
*/
@end
