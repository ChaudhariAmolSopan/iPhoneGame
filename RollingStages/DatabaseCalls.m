//
//  DatabaseCalls.m
//  RollingStages
//
//  Created by Amol Chaudhari on 2/25/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "DatabaseCalls.h"
#import "AppDelegate.h"

@implementation DatabaseCalls
@synthesize playerArray,managedObjectContext;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        managedObjectContext = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext]; 
        NSLog(@"After managedObjectContext: %@",  managedObjectContext);

    }
    
    return self;
}




-(void)insertPlayer:(NSString *)playerName levelName:(NSString*)levelName
                                            score:(NSString *)score
{

    ScoreEntity *scoreEntity = [NSEntityDescription insertNewObjectForEntityForName:@"ScoreEntity" inManagedObjectContext:managedObjectContext];
    [scoreEntity setPlayerName:playerName];

    [scoreEntity setDateTime:[NSDate date]];
    
    [scoreEntity setScore:score];
    [scoreEntity setLevelName:levelName];
    
    
    NSError *error;
    
    if (![managedObjectContext save:&error]) {
        ///This is a serious error saying the record  
        //could not be saved. Advise the user to  
        //try again or restart the application.
        
        NSLog(@"Failed to set data");
    }

    

}



-(NSMutableArray *)fetchPlayerName
{
    // Define our table/entity to use  

    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ScoreEntity" inManagedObjectContext:managedObjectContext];
    // Setup the fetch request  

    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    
    // Define how we will sort the records  
NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"playerName" ascending:YES]
    ;
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    [sortDescriptor release];
    
    
    // Fetch the records and handle an error  
    NSError *error;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    
    if (!mutableFetchResults) {
        
        // Handle the error.  
        // This is a serious error and should advise the user to restart the application 
        NSLog(@"Failed to receive data");
    }
    
    [request release];
    
    for (int i=0; i<[mutableFetchResults count]; i++) {
        ScoreEntity *scoreEntity=[mutableFetchResults objectAtIndex:i];

        NSLog(@"The fetched data is %@", [scoreEntity playerName] );

        
        
    }
    
    
    return mutableFetchResults;
    
}

@end
