//
//  Weapon.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "Weapon.h"
#import "Element.h"
#import "PlayerWeapon.h"


@implementation Weapon

@dynamic damageHigh;
@dynamic damageLow;
@dynamic imageName;
@dynamic price;
@dynamic title;
@dynamic weaponHasManyPlayerWeapons;
@dynamic weaponBelongsToElement;


+(Weapon *) newInContext:(NSManagedObjectContext *)context {
    Weapon * weapon = (Weapon *) [NSEntityDescription insertNewObjectForEntityForName:@"Weapon" inManagedObjectContext:context];
    
    return weapon;
}

+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Weapon"];
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    return array;
}

+(Weapon *) getWeaponWithTitle:(NSString *)theTitle inContext:(NSManagedObjectContext *)context {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Weapon"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title == %@", theTitle];
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

-(int) getDamage {
    int randomNum = [self.damageLow intValue] + arc4random() % ([self.damageHigh intValue] - [self.damageLow intValue]);
    return randomNum;
}

@end
