//
//  Player.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "Player.h"
#import "PlayerWeapon.h"


@implementation Player

@dynamic name;
@dynamic imageName;
@dynamic health;
@dynamic money;
@dynamic strength;
@dynamic playerHasManyPlayerWeapons;
@dynamic playerHasManyPlayerElements;
@dynamic playerHasOneSelectedPlayerWeapon;




+(Player *) newInContext:(NSManagedObjectContext *)context {
    Player * player = (Player *) [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:context];
    
    return player;
}

+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Player"];
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    return array;
}

+(Player *) getPlayerInContext:(NSManagedObjectContext *)context {
    
    NSArray *array = [self getAllRecordsInContext:context];
    if([array count]>0) {
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
