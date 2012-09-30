//
//  EnemyElement.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "EnemyElement.h"
#import "Element.h"
#import "Enemy.h"


@implementation EnemyElement

@dynamic weakness;
@dynamic enemy;
@dynamic element;


+(EnemyElement *) newInContext:(NSManagedObjectContext *)context {
    EnemyElement * enemyElement = (EnemyElement *) [NSEntityDescription insertNewObjectForEntityForName:@"EnemyElement" inManagedObjectContext:context];
    
    return enemyElement;
}

+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"EnemyElement"];
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    return array;
}

-(void) saveInContext:(NSManagedObjectContext *) context {
    NSError *error;
    [context save:&error];
    
}

@end
