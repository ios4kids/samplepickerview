//
//  Enemy.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/30/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "Enemy.h"
#import "EnemyElement.h"
#import "GameSettings.h"
#import "PlayerWeapon.h"
#import "Player.h"
#import "Element.h"

@implementation Enemy

@dynamic damageHigh;
@dynamic damageLow;
@dynamic health;
@dynamic imageName;
@dynamic name;
@dynamic enemyElements;
@dynamic gameSetting;


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

-(void) getsAttackedByPlayer:(Player *)thePlayer andWeapon:(Weapon *)theWeapon andContext: (NSManagedObjectContext *) theContext {
    
    int damage = [thePlayer.selectedPlayerWeapon.weapon getDamage];
    
    
    Element *element = theWeapon.element;
    
    float weakness = [self getWeaknessForElement:element];
    
    float overallDamage = (float) damage/100.0 * weakness;
    
    self.health = [NSNumber numberWithFloat:([self.health floatValue] - overallDamage)];
    
    [self saveInContext:theContext];
    
}


-(float) getWeaknessForElement:(Element *) theElement {
    float result = 100;
    for(EnemyElement * currentEnemyElement in self.enemyElements) {
        if (currentEnemyElement.element.name == theElement.name) {
            result = [currentEnemyElement.weakness floatValue];
        }
    }
    return result;
}

@end
