//
//  AppDelegate.h
//  RollingStages
//
//  Created by Amol Chaudhari on 12/18/11.
//  Copyright nyu-poly 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreEntity.h"
@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	NSManagedObjectModel *managedObjectModel;
	NSManagedObjectContext *managedObjectContext;	    
	NSPersistentStoreCoordinator *persistentStoreCoordinator;
    
    
    
    UIWindow			*window;
	RootViewController	*viewController;
    
    BOOL hasPlayerMadeContact;
    BOOL detectCollisionToReduceHealth;
}
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, readwrite)BOOL hasPlayerMadeContact;
@property (nonatomic, readwrite)   BOOL detectCollisionToReduceHealth;

@end
