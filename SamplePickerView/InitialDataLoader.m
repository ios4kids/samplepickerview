//
//  InitialDataLoader.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "InitialDataLoader.h"
#import "EnemyAttackElement.h"

@implementation InitialDataLoader

-(id) initWithContext:(NSManagedObjectContext *)context {
    
    self = [super init];
    self.managedObjectContext = context;
    return self;
}

-(void) loadAll {
    if ([self databaseIsEmtpy]) {
        [self loadElements];
        [self loadWeapons];
        [self loadPlayerDefaults];
        [self loadEnemies];
        [self loadGameDefaults];
    }
}

-(void) loadElements {
    Element * element;
    
    element = [Element newInContext:self.managedObjectContext];
    element.name = @"Earth";
    element.imageName = @"earth.png";
    [element saveInContext:self.managedObjectContext];
    
    element = [Element newInContext:self.managedObjectContext];
    element.name = @"Wind";
    element.imageName = @"wind.png";
    [element saveInContext:self.managedObjectContext];
    
    element = [Element newInContext:self.managedObjectContext];
    element.name = @"Water";
    element.imageName = @"water.png";
    [element saveInContext:self.managedObjectContext];
    
    element = [Element newInContext:self.managedObjectContext];
    element.name = @"Light";
    element.imageName = @"light.png";
    [element saveInContext:self.managedObjectContext];

    element = [Element newInContext:self.managedObjectContext];
    element.name = @"Ice";
    element.imageName = @"ice.png";
    [element saveInContext:self.managedObjectContext];

    element = [Element newInContext:self.managedObjectContext];
    element.name = @"Fire";
    element.imageName = @"fire.png";
    [element saveInContext:self.managedObjectContext];

    element = [Element newInContext:self.managedObjectContext];
    element.name = @"Energy";
    element.imageName = @"energy.png";
    [element saveInContext:self.managedObjectContext];

    element = [Element newInContext:self.managedObjectContext];
    element.name = @"Darkness";
    element.imageName = @"darkness.png";
    [element saveInContext:self.managedObjectContext];



}

-(void) loadWeapons {
    
    Weapon * theWeapon;
    Element * theElement;
    
    theElement = [Element getElementWithName:@"Earth" inContext:self.managedObjectContext];
    
    theWeapon = [Weapon newInContext:self.managedObjectContext];
    theWeapon.title = @"Earth Sword";
    theWeapon.damageHigh = [NSNumber numberWithInt:9];
    theWeapon.damageLow = [NSNumber numberWithInt:3];
    theWeapon.price = [[NSDecimalNumber alloc] initWithString:@"30"];
    theWeapon.imageName = @"woodSword.png";
    theWeapon.weaponBelongsToElement = theElement;
    [theWeapon saveInContext:self.managedObjectContext];
    
    
     theElement = [Element getElementWithName:@"Wind" inContext:self.managedObjectContext];
    theWeapon = [Weapon newInContext:self.managedObjectContext];
    theWeapon.title = @"Wind Sword";
    theWeapon.damageHigh = [NSNumber numberWithInt:9];
    theWeapon.damageLow = [NSNumber numberWithInt:3];
    theWeapon.price = [[NSDecimalNumber alloc] initWithString:@"30"];
    theWeapon.imageName = @"windSword.png";
    theWeapon.weaponBelongsToElement = theElement;
    [theWeapon saveInContext:self.managedObjectContext];
    
    theElement = [Element getElementWithName:@"Water" inContext:self.managedObjectContext];
    theWeapon = [Weapon newInContext:self.managedObjectContext];
    theWeapon.title = @"Water Sword";
    theWeapon.damageHigh = [NSNumber numberWithInt:9];
    theWeapon.damageLow = [NSNumber numberWithInt:3];
    theWeapon.price = [[NSDecimalNumber alloc] initWithString:@"30"];
    theWeapon.imageName = @"waterSword.png";
    theWeapon.weaponBelongsToElement = theElement;
    [theWeapon saveInContext:self.managedObjectContext];
    
    theElement = [Element getElementWithName:@"Light" inContext:self.managedObjectContext];
    theWeapon = [Weapon newInContext:self.managedObjectContext];
    theWeapon.title = @"Light Sword";
    theWeapon.damageHigh = [NSNumber numberWithInt:9];
    theWeapon.damageLow = [NSNumber numberWithInt:3];
    theWeapon.price = [[NSDecimalNumber alloc] initWithString:@"30"];
    theWeapon.imageName = @"lightSword.png";
    theWeapon.weaponBelongsToElement = theElement;
    [theWeapon saveInContext:self.managedObjectContext];
    
    theElement = [Element getElementWithName:@"Ice" inContext:self.managedObjectContext];
    theWeapon = [Weapon newInContext:self.managedObjectContext];
    theWeapon.title = @"Ice Sword";
    theWeapon.damageHigh = [NSNumber numberWithInt:9];
    theWeapon.damageLow = [NSNumber numberWithInt:3];
    theWeapon.price = [[NSDecimalNumber alloc] initWithString:@"30"];
    theWeapon.imageName = @"iceSword.png";
    theWeapon.weaponBelongsToElement = theElement;
    [theWeapon saveInContext:self.managedObjectContext];
   
    theElement = [Element getElementWithName:@"Fire" inContext:self.managedObjectContext];
    theWeapon = [Weapon newInContext:self.managedObjectContext];
    theWeapon.title = @"Fire Sword";
    theWeapon.damageHigh = [NSNumber numberWithInt:9];
    theWeapon.damageLow = [NSNumber numberWithInt:3];
    theWeapon.price = [[NSDecimalNumber alloc] initWithString:@"30"];
    theWeapon.imageName = @"fireSword.png";
    theWeapon.weaponBelongsToElement = theElement;
    [theWeapon saveInContext:self.managedObjectContext];
    
    theElement = [Element getElementWithName:@"Energy" inContext:self.managedObjectContext];
    theWeapon = [Weapon newInContext:self.managedObjectContext];
    theWeapon.title = @"Energy Sword";
    theWeapon.damageHigh = [NSNumber numberWithInt:9];
    theWeapon.damageLow = [NSNumber numberWithInt:3];
    theWeapon.price = [[NSDecimalNumber alloc] initWithString:@"30"];
    theWeapon.imageName = @"energySword.png";
    theWeapon.weaponBelongsToElement = theElement;
    [theWeapon saveInContext:self.managedObjectContext];
    
    theElement = [Element getElementWithName:@"Darkness" inContext:self.managedObjectContext];
    theWeapon = [Weapon newInContext:self.managedObjectContext];
    theWeapon.title = @"Dark Sword";
    theWeapon.damageHigh = [NSNumber numberWithInt:9];
    theWeapon.damageLow = [NSNumber numberWithInt:3];
    theWeapon.price = [[NSDecimalNumber alloc] initWithString:@"30"];
    theWeapon.imageName = @"darkSword.png";
    theWeapon.weaponBelongsToElement = theElement;
    [theWeapon saveInContext:self.managedObjectContext];
    
}

-(void) loadPlayerDefaults {
    Player *player = [Player newInContext:self.managedObjectContext];
    player.name = @"Miguel";
    player.health = [[NSDecimalNumber alloc] initWithString:@"100.0"];
    player.money = [[NSDecimalNumber alloc] initWithString:@"30.00"];
    player.strength = [NSNumber numberWithInteger:10];
    player.imageName = @"player.png";
    [player saveInContext:self.managedObjectContext];
    
    Element * element;
    PlayerElement * playerElement;
    
    // how Earth affects the player
    element = [Element getElementWithName:@"Earth" inContext:self.managedObjectContext];
    playerElement = [PlayerElement newInContext:self.managedObjectContext];
    playerElement.playerElementBelongsToPlayer = player;
    playerElement.playerElementBelongsToElement = element;
    playerElement.weakness = [[NSDecimalNumber alloc] initWithString:@"90.0"];
    [playerElement saveInContext:self.managedObjectContext];
    
    element = [Element getElementWithName:@"Wind" inContext:self.managedObjectContext];
    playerElement = [PlayerElement newInContext:self.managedObjectContext];
    playerElement.playerElementBelongsToPlayer = player;
    playerElement.playerElementBelongsToElement = element;
    playerElement.weakness = [[NSDecimalNumber alloc] initWithString:@"100.0"];
    [playerElement saveInContext:self.managedObjectContext];
    
    element = [Element getElementWithName:@"Water" inContext:self.managedObjectContext];
    playerElement = [PlayerElement newInContext:self.managedObjectContext];
    playerElement.playerElementBelongsToPlayer = player;
    playerElement.playerElementBelongsToElement = element;
    playerElement.weakness = [[NSDecimalNumber alloc] initWithString:@"100.0"];
    [playerElement saveInContext:self.managedObjectContext];
    
    element = [Element getElementWithName:@"Light" inContext:self.managedObjectContext];
    playerElement = [PlayerElement newInContext:self.managedObjectContext];
    playerElement.playerElementBelongsToPlayer = player;
    playerElement.playerElementBelongsToElement = element;
    playerElement.weakness = [[NSDecimalNumber alloc] initWithString:@"90.0"];
    [playerElement saveInContext:self.managedObjectContext];
    
    element = [Element getElementWithName:@"Ice" inContext:self.managedObjectContext];
    playerElement = [PlayerElement newInContext:self.managedObjectContext];
    playerElement.playerElementBelongsToPlayer = player;
    playerElement.playerElementBelongsToElement = element;
    playerElement.weakness = [[NSDecimalNumber alloc] initWithString:@"100.0"];
    [playerElement saveInContext:self.managedObjectContext];
    
    element = [Element getElementWithName:@"Fire" inContext:self.managedObjectContext];
    playerElement = [PlayerElement newInContext:self.managedObjectContext];
    playerElement.playerElementBelongsToPlayer = player;
    playerElement.playerElementBelongsToElement = element;
    playerElement.weakness = [[NSDecimalNumber alloc] initWithString:@"120.0"];
    [playerElement saveInContext:self.managedObjectContext];
    
    
    element = [Element getElementWithName:@"Energy" inContext:self.managedObjectContext];
    playerElement = [PlayerElement newInContext:self.managedObjectContext];
    playerElement.playerElementBelongsToPlayer = player;
    playerElement.playerElementBelongsToElement = element;
    playerElement.weakness = [[NSDecimalNumber alloc] initWithString:@"100.0"];
    [playerElement saveInContext:self.managedObjectContext];
    
    element = [Element getElementWithName:@"Darkness" inContext:self.managedObjectContext];
    playerElement = [PlayerElement newInContext:self.managedObjectContext];
    playerElement.playerElementBelongsToPlayer = player;
    playerElement.playerElementBelongsToElement = element;
    playerElement.weakness = [[NSDecimalNumber alloc] initWithString:@"110.0"];
    [playerElement saveInContext:self.managedObjectContext];
    
    
    
    
    
    
    Weapon *weapon;
    
    // load as many weapons that the Player will have at the beginning
    weapon = [Weapon getWeaponWithTitle:@"Earth Sword" inContext:self.managedObjectContext];
    PlayerWeapon *playerWeapon = [PlayerWeapon newInContext:self.managedObjectContext];
    playerWeapon.playerWeaponBelongsToPlayer = player;
    playerWeapon.playerWeaponBelongsToWeapon = weapon;
    [playerWeapon saveInContext:self.managedObjectContext];
    
    //set the current weapon selected by the player
    player.playerHasOneSelectedPlayerWeapon = playerWeapon;
    [player saveInContext:self.managedObjectContext];
    
}

-(void) loadEnemies {
    Enemy * enemy;
    Element * element;
    EnemyElement * enemyElement;
    EnemyAttackElement * enemyAttackElement;
    
    enemy = [Enemy newInContext:self.managedObjectContext];
    enemy.name = @"Alligator";
    enemy.damageHigh = [NSNumber numberWithInt:8];
    enemy.damageLow = [NSNumber numberWithInt:2];
    enemy.health = [NSNumber numberWithInt:120];

    enemy.imageName = @"alligator.png";
    
    [enemy saveInContext:self.managedObjectContext];
    
    
    //attack elements
    element = [Element getElementWithName:@"Earth" inContext:self.managedObjectContext];
    enemyAttackElement = [EnemyAttackElement newInContext:self.managedObjectContext];
    enemyAttackElement.element = element;
    enemyAttackElement.enemy = enemy;
    [enemyAttackElement saveInContext:self.managedObjectContext];
    
    element = [Element getElementWithName:@"Water" inContext:self.managedObjectContext];
    enemyAttackElement = [EnemyAttackElement newInContext:self.managedObjectContext];
    enemyAttackElement.element = element;
    enemyAttackElement.enemy = enemy;
    [enemyAttackElement saveInContext:self.managedObjectContext];
    
    // how Earth affects the alligator
    element = [Element getElementWithName:@"Earth" inContext:self.managedObjectContext];

    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"90.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Water affects the alligator
    element = [Element getElementWithName:@"Water" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"70.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Wind affects the alligator
    element = [Element getElementWithName:@"Wind" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"130.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Light affects the alligator
    element = [Element getElementWithName:@"Light" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"110.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Ice affects the alligator
    element = [Element getElementWithName:@"Ice" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"100.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Fire affects the alligator
    element = [Element getElementWithName:@"Fire" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"130.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Energy affects the alligator
    element = [Element getElementWithName:@"Energy" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"150.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Darkness affects the alligator
    element = [Element getElementWithName:@"Darkness" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"90.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    
    
    enemy = [Enemy newInContext:self.managedObjectContext];
    enemy.name = @"Hawk";
    enemy.imageName = @"hawk.png";
    enemy.damageHigh = [NSNumber numberWithInt:15];
    enemy.damageLow = [NSNumber numberWithInt:5];
    enemy.health = [NSNumber numberWithInt:70];
    [enemy saveInContext:self.managedObjectContext];
    
    // how Earth affects the enemy
    element = [Element getElementWithName:@"Earth" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"170.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Water affects the enemy
    element = [Element getElementWithName:@"Water" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"100.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Wind affects the alligator
    element = [Element getElementWithName:@"Wind" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"70.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Light affects the alligator
    element = [Element getElementWithName:@"Light" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"90.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Ice affects the enemy
    element = [Element getElementWithName:@"Ice" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"100.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Fire affects the enemy
    element = [Element getElementWithName:@"Fire" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"110.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Energy affects the enemy
    element = [Element getElementWithName:@"Energy" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"90.0"];
    [enemyElement saveInContext:self.managedObjectContext];
    
    // how Darkness affects the enemy
    element = [Element getElementWithName:@"Darkness" inContext:self.managedObjectContext];
    enemyElement = [EnemyElement newInContext:self.managedObjectContext];
    enemyElement.enemyElementBelongsToElement = element;
    enemyElement.enemyElementBelongsToEnemy = enemy;
    enemyElement.weakness = [[NSDecimalNumber alloc] initWithString:@"120.0"];
    [enemyElement saveInContext:self.managedObjectContext];

}

-(void) loadGameDefaults {
    GameSettings * gameSettings;
    gameSettings = [GameSettings newInContext:self.managedObjectContext];
    Enemy * enemy = [Enemy getEnemyWithName:@"Alligator" inContext:self.managedObjectContext];
    gameSettings.currentEnemy = enemy;
    [gameSettings saveInContext:self.managedObjectContext];
    
}



-(BOOL) databaseIsEmtpy {
    NSArray *array = [Weapon getAllRecordsInContext:self.managedObjectContext];
    return ([array count] < 1);
}



@end
