//
//  ActionLayer.m
//  Raycast
//
//  Created by Amol Chaudhari on 12/17/11.
//  Copyright 2011 nyu-poly. All rights reserved.
//

#import "ActionLayer.h"
#import "SimpleAudioEngine.h"
#import "ContactListener.h"
#import "HealthBar.h"
#import "UDRevoluteJointMethods.h"

#import "ScoringSystem.h"

#define PTM_RATIO ((UI_USER_INTERFACE_IDIOM() == \
UIUserInterfaceIdiomPad) ? 100.0:50.0)




@implementation ActionLayer
@synthesize dictionaryForEmitters,label;
/*
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

 */

+(id)scene
{
    CCScene *scene = [CCScene node];
    
    ActionLayer *layer = [ActionLayer node];
    [scene addChild:layer];
    
    return scene;
}




-(void)setUpWorld
{
    b2Vec2 gravity = b2Vec2(0.0f,0.0f);
    bool doSleep = false;
    _world = new b2World(b2Vec2(0, 0)); 
    
    
    
    
}



-(void)setUpLevelHelper
{

    _lhelper = [[LevelHelperLoader alloc] initWithContentOfFile:@"FirstStage"];
    [_lhelper addObjectsToWorld:_world cocos2dLayer:self];
   // [lh createPhysicBoundaries:world];
    [_lhelper createGravity:_world];
    
    
    
    _player = [_lhelper spriteWithUniqueName:@"skull"];
    NSAssert(_player != nil, @"Couldnt find player");
    
  //  _bonusSensor =[_lhelper spriteWithUniqueName:@"particleSensor1"];
    //NSAssert(_bonusSensor != nil, @"Couldnt find sensor Object");
    


 /* LHSprite *_bonusSensor2 =[_lhelper spriteWithUniqueName:@"particleSensor2"];
    NSAssert(_bonusSensor2 != nil, @"Couldnt find sensor Object");
    
    LHSprite *_bonusSensor3 =[_lhelper spriteWithUniqueName:@"particleSensor3"];
    NSAssert(_bonusSensor3 != nil, @"Couldnt find sensor Object");
  */
    
 //   mutableArrayForSensors = [[NSMutableArray alloc]initWithObjects:_bonusSensor2,_bonusSensor3, nil];
    
   // _playerBody = [_lhelper]
    
    
}

- (void)setUpDebugDraw { 
/*    GLESDebugDraw *m_debugDraw;

    m_debugDraw = new GLESDebugDraw();
    _world->SetDebugDraw(m_debugDraw);
    
    uint32 flags = 0;
    flags += b2Draw::e_shapeBit;
    flags += b2Draw::e_jointBit;
    m_debugDraw->SetFlags(flags);		

*/



}

- (void)setUpAudio {
 /*   [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"Raycast.m4a"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"ground.wav"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"laser.wav"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"wing.wav"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"whine.wav"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"lose.wav"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"win.wav"];
  */
}

- (id)init {
    if ((self = [super init])) {
        [self setUpWorld];

        [self setUpLevelHelper];
     //   [self setUpDebugDraw];
        [self createGround];
        self.isAccelerometerEnabled=TRUE;
        _player.body->SetGravityScale(2.0);
        isContactMade=NO;
        self.isTouchEnabled=YES;
        
        
        //Background start
        
        
        //sets the pixel format to RGB565 before loading the background image—it’s good practice to use a lower qual- ity pixel format when loading large images (such as background images) to conserve memory usage, which is quite limited on iOS devices
        
        //Warning
        //If you don’t make wise use of setting pixel formats and load a lot of massive images, eventually you will run out of memory and the OS will shut down your app. To learn more about pixel formats, check out this great post written by Ricardo Quesada on the Cocos2D site:
        //  http://www.cocos2d-iphone.org/archives/61
     /*   
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGB565];
        CCSprite *background = [CCSprite spriteWithFile:@"TableTop.png"];
        background.anchorPoint = ccp(0,0);
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_Default];
        [self addChild:background z:-1];
*/
        
        
        //Background end
        scoringSystem = [[ScoringSystem alloc]init];

        
        emitterMethods = [[UDEmitterMethods alloc] initWithLevelHelper:_lhelper LevelHelperTag:WHITEGOODBONUS bonusPlistName:@"WhiteGoodBonus.plist" andScoringSystem:scoringSystem];
        
        [self addChild:emitterMethods];
        
        
        badBonusEmitterMethods = [[UDEmitterMethods alloc] initWithLevelHelper:_lhelper LevelHelperTag:REDBADBONUS bonusPlistName:@"RedBadBonus.plist" andScoringSystem:scoringSystem];
        [self addChild:badBonusEmitterMethods];
        
        
        
        
        victoryMethods =[[UDEmitterMethods alloc]initWithLevelHelper:_lhelper LevelHelperTag:VICTORY bonusPlistName:@"RedBadBonus.plist" andScoringSystem:scoringSystem];
        [self addChild:victoryMethods];
        
        CGSize screenSize = [CCDirector sharedDirector].winSize; 

        label = [CCLabelTTF labelWithString:@"Hello " fontName:@"Marker Felt" fontSize:24];
        label.position = ccp(screenSize.width/2, screenSize.height-10);
        [self addChild:label];
        
        
        ContactListener *contactListener = new ContactListener();
        
        
        
        
        _world->SetContactListener(contactListener);
        
        [self setUpAudio];
        [self scheduleUpdate];
        
        appDelegate = 	 (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        
        
        
      
        
        
        //Healthbar start
     //   [self healthBar];
    healthBar= [[HealthBar alloc]init];
        [self addChild:healthBar];
        //Healthbar end
        
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

    
    //Particles System Start
/*    CGPoint newPosition=[_bonusSensor position];
    if (emitter.active == YES) {
        [emitter setPosition:newPosition];
}
 */
    
    [emitterMethods detectCollisionWithSensors];
    [badBonusEmitterMethods detectCollisionWithSensors];
    [victoryMethods detectCollisionWithSensors];
  //  NSLog(@"The score richard is %d",[scoringSystem getScore]);
    
    [label setString:[NSString stringWithFormat:@"%d",[scoringSystem getScore]]];
    
    //end
    
    //For the upper and lower limit
    [UDRevoluteJointMethods motorJoint:_lhelper jointName:@"ThirdRevoluteJoint" withUpperLimit:15 andLowerLimit:-15];  //0.1 0.5
    [UDRevoluteJointMethods motorJoint:_lhelper jointName:@"SecondRevoluteJoint" withUpperLimit:10 andLowerLimit:-5];
    
}

-(void) draw {  
    
  /*  glClearColor(98.0/255.0, 183.0/255.0, 214.0/255.0, 255.0/255.0);
    glClear(GL_COLOR_BUFFER_BIT);	
    
    glDisable(GL_TEXTURE_2D);
    glDisableClientState(GL_COLOR_ARRAY);
    glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    
    _world->DrawDebugData();
    
    glEnable(GL_TEXTURE_2D);
    glEnableClientState(GL_COLOR_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);	
   */
}


-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    //This simply converts the accelerometer input to a gravity vector. It multiplies the accelerometer result (which typically ranges between −1 and 1) by 15, in order to get a nice feel for gravity in the level. Since Space Viking is set up to run in landscape mode (and accelerometer data is given in portrait orientation), it reverses the x and y coordi- nates and f lips the sign of the y coordinate to get the proper vector.
    b2Vec2 gravity (-acceleration.y * 50,acceleration.x * 50);
    
    
    
 //   b2Fixture *playerContact = _player.body->GetFixtureList();
    if ( appDelegate.detectCollisionToReduceHealth) {
        
      //  [healthBar reduceHealthPercent:0.1f];
        
        appDelegate.detectCollisionToReduceHealth=NO;
    }
    
    if (appDelegate.hasPlayerMadeContact) {

        b2Vec2 gravity (-acceleration.y * 30,acceleration.x * 30);

            _world ->SetGravity(gravity);


    }
    else
    {
      //  [self setHealthPercent:-0.1f];

        _player.body->SetLinearVelocity(gravity);

      //  NSLog(@"Inside player linear velocity");
    }
    
   
   }









- (void)dealloc {
    [_lhelper release];
   // [emitter release];
    _lhelper = nil;
    delete _world;
    [super dealloc];
}



@end
