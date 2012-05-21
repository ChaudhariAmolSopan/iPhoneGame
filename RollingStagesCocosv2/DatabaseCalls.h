//
//  DatabaseCalls.h
//  RollingStages
//
//  Created by Amol Chaudhari on 2/25/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "ScoreEntity.h"
@interface DatabaseCalls : NSObject<UIApplicationDelegate>
{
    NSManagedObjectContext *managedObjectContext;
    NSMutableArray *playerArray;
    
    
}

@property(nonatomic,retain)    NSManagedObjectContext *managedObjectContext;

@property(nonatomic,retain)    NSMutableArray *playerArray;

-(NSMutableArray *)fetchPlayerName;
-(void)insertPlayer:(NSString *)playerName levelName:(NSString*)levelName
              score:(NSString *)score;

@end
