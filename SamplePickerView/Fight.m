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
    
    self.gameSettings = [GameSettings getGameSettingsInContext:self.managedObjectContext];
    
    
    
    self.currentEnemy = [Enemy getEnemyWithName:@"Alligator" inContext:self.managedObjectContext];
                         
    self.gameSettings.currentEnemy = self.currentEnemy;
    [self.gameSettings saveInContext:self.managedObjectContext];
    
    self.player = [Player getPlayerInContext:self.managedObjectContext];
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

-(int)attack {
    //0 no one died
    //1 player died
    //2 enemy died
    
    int result = 0;
    
    if ([self getRandomNumber:1 to:100] > 50) {
        NSLog(@"playerFirst");
        result = [self playerAttacksFirst];
    }
    else {
        result = [self enemyAttacksFirst];
        NSLog(@"EmenyFIst");
    }
    
    return result;
}

-(int) playerAttacksFirst {
    [self playerAttack];
    if (self.currentEnemy.health < 0) {
        return 2;
    }
    [self enemyAttack];
    
    if (self.player.health < 0) {
        return 1;
    }
    
    return 0;
}

-(int) enemyAttacksFirst {
    [self enemyAttack];
    if (self.player.health < 0) {
        return 1;
    }
    [self playerAttack];
    
    if (self.currentEnemy.health < 0) {
        return 2;
    }
    
    return 0;
}

-(int)getRandomNumber:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}

@end
