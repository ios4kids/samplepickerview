//
//  Element.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "Element.h"
#import "Weapon.h"


@implementation Element

@dynamic name;
@dynamic imageName;
@dynamic elementHasManyPlayerElements;
@dynamic elementHasManyEnemyElements;
@dynamic elementHasManyWeapons;


+(Element *) newInContext:(NSManagedObjectContext *)context {
    Element * element = (Element *) [NSEntityDescription insertNewObjectForEntityForName:@"Element" inManagedObjectContext:context];
    
    return element;
}

+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Element"];
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    return array;
}

+(Element *) getElementWithName:(NSString *)theName inContext:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Element"];
    
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
