//
//  ScoreEntity.h
//  RollingStages
//
//  Created by Amol Chaudhari on 2/26/12.
//  Copyright (c) 2012 nyu-poly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ScoreEntity : NSManagedObject {
@private
}
@property (nonatomic, retain) NSDate * dateTime;
@property (nonatomic, retain) NSString * playerName;
@property (nonatomic, retain) NSString * levelName;
@property (nonatomic, retain) NSString * score;

@end
