//
//  Store.m
//  SamplePickerView
//
//  Created by Miguel Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "Store.h"
#import "PlayerWeapon.h"

@implementation Store

-(id) initWithContext:(NSManagedObjectContext *) context {
    self = [super init];
    self.managedObjectContext = context;
    self.errorMessage = @"";
    return self;
}

-(BOOL)canMakePurchase {
    return  (![self alreadyOwnsWeapon] && [self hasEnoughMoney]);
}

-(BOOL) hasEnoughMoney {
    if ([self.player.money doubleValue] >= [self.weapon.price doubleValue]) {
        return YES;
    }
    else {
        self.errorMessage = [self.errorMessage stringByAppendingString:@"Not enough money."];
        return NO;
    }
    
}

-(BOOL) alreadyOwnsWeapon {

    NSArray * playerWeapons = [self.player.playerWeapons allObjects];
    for (PlayerWeapon *playerWeapon in playerWeapons) {
        if (self.weapon.title == playerWeapon.weapon.title) {
            self.errorMessage = [self.errorMessage stringByAppendingString:@"You already own the weapon"];
            return YES;
        }
    }
    return NO;
}

-(void)makePurchase {
    PlayerWeapon *playerWeapon = [PlayerWeapon newInContext:self.managedObjectContext];
    playerWeapon.player = self.player;
    playerWeapon.weapon = self.weapon;
    [playerWeapon saveInContext:self.managedObjectContext];
    
    self.player.money = [self.player.money decimalNumberBySubtracting:self.weapon.price];
    [self.player saveInContext:self.managedObjectContext];
}

@end
