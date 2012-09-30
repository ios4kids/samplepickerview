//
//  Fight.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "Fight.h"

@implementation Fight

-(id) initInContext:(NSManagedObjectContext *)context {
    self = [super init];
    self.managedObjectContext = context;
    return self;
}

-(id) initInContext:(NSManagedObjectContext *) context withPlayer:(Player*) thePlayer withEnemy:(Enemy *) theEnemy {
    self = [super init];
    self.managedObjectContext = context;
    self.player = thePlayer;
    self.currentEnemy = theEnemy;
    return self;
}

-(void) playerAttack {
    
    
    [self.currentEnemy getsAttackedByPlayer:self.player andWeapon:self.player.playerHasOneSelectedPlayerWeapon.playerWeaponBelongsToWeapon andContext:self.managedObjectContext];
    
    
    
    
}

-(void) enemyAttack {
    [self playerGetsAttackedByEnemy];
}

- (void) playerGetsAttackedByEnemy{
    
    int damage = [self.currentEnemy getDamage];
    
    Element *element = [self.currentEnemy getAttackElement];
    
    float weakness = [self.player getWeaknessForElement:element];
    
    float overallDamage = (float) damage/100.0 * weakness;
    
    self.player.health = [NSNumber numberWithFloat:([self.player.health floatValue] - overallDamage)];
    
    [self.player saveInContext:self.managedObjectContext];
    
}

@end
