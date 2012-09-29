//
//  PlayerElement.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "PlayerElement.h"
#import "Element.h"
#import "Player.h"


@implementation PlayerElement

@dynamic weakness;
@dynamic playerElementBelongsToPlayer;
@dynamic playerElementBelongsToElement;


+(PlayerElement *) newInContext:(NSManagedObjectContext *)context {
    PlayerElement * playerElement = (PlayerElement *) [NSEntityDescription insertNewObjectForEntityForName:@"PlayerElement" inManagedObjectContext:context];
    
    return playerElement;
}

+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"PlayerElement"];
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    return array;
}

-(void) saveInContext:(NSManagedObjectContext *) context {
    NSError *error;
    [context save:&error];
    
}


@end
