//
//  Enemy.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "Enemy.h"


@implementation Enemy

@dynamic name;
@dynamic imageName;
@dynamic damageLow;
@dynamic damageHigh;
@dynamic health;
@dynamic enemyHasManyEnemyElements;


+(Enemy *) newInContext:(NSManagedObjectContext *)context {
    Enemy * enemy = (Enemy *) [NSEntityDescription insertNewObjectForEntityForName:@"Enemy" inManagedObjectContext:context];
    
    return enemy;
}

+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Enemy"];
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    return array;
}

+(Enemy *) getEnemyWithName:(NSString *)theName inContext:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Enemy"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", theName];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    if ([array count] > 0) {
        return [array objectAtIndex:0];
    }
    else {
        return nil;
    }
    
}


-(void) saveInContext:(NSManagedObjectContext *) context {
    NSError *error;
    [context save:&error];
    
}

@end
