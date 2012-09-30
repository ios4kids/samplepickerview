//
//  PlayerWeapon.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "PlayerWeapon.h"
#import "Player.h"
#import "Weapon.h"


@implementation PlayerWeapon

@dynamic quantity;
@dynamic player;
@dynamic weapon;
@dynamic currentlySelectedByPlayer;


+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"PlayerWeapon"];
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    return array;
}


+(PlayerWeapon *) newInContext:(NSManagedObjectContext *)context {
    PlayerWeapon * playerWeapon = (PlayerWeapon *) [NSEntityDescription insertNewObjectForEntityForName:@"PlayerWeapon" inManagedObjectContext:context];
    
    return playerWeapon;
}


-(void) saveInContext:(NSManagedObjectContext *) context {
    NSError *error;
    [context save:&error];
    
}

@end
