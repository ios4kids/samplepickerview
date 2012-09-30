//
//  Enemy.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "Enemy.h"
#import "EnemyAttackElement.h"

@implementation Enemy

@dynamic name;
@dynamic imageName;
@dynamic damageLow;
@dynamic damageHigh;
@dynamic health;
@dynamic enemyHasManyEnemyElements;
@dynamic enemyAttackElements;



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
    
    int damage = [thePlayer.playerHasOneSelectedPlayerWeapon.playerWeaponBelongsToWeapon getDamage];
    
    Element *element = theWeapon.weaponBelongsToElement;
    
    float weakness = [self getWeaknessForElement:element];
    
    float overallDamage = (float) damage/100.0 * weakness;
    
    self.health = [NSNumber numberWithFloat:([self.health floatValue] - overallDamage)];
    
    [self saveInContext:theContext];
    
}


-(float) getWeaknessForElement:(Element *) theElement {
    float result = 100;
    for(EnemyElement * currentEnemyElement in self.enemyHasManyEnemyElements) {
        if (currentEnemyElement.enemyElementBelongsToElement.name == theElement.name) {
            result = [currentEnemyElement.weakness floatValue];
        }
    }
    return result;
}

-(int) getDamage {
    int randomNum = [self.damageLow intValue] + arc4random() % ([self.damageHigh intValue] - [self.damageLow intValue]);
    return randomNum;
}

-(Element *) getAttackElement {
    
    
    int randomNum = arc4random() % ([[self.enemyAttackElements allObjects] count]-1);
    
    EnemyAttackElement * attackElement = [[self.enemyAttackElements allObjects] objectAtIndex:randomNum];
    
    return attackElement.element;
}
@end
