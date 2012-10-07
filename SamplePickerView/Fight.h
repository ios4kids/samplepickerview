//
//  Fight.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Enemy.h"
#import "GameSettings.h"
#import "Element.h"

@interface Fight : NSObject

@property NSManagedObjectContext * managedObjectContext;

@property Player *player;

@property Enemy *currentEnemy;

@property GameSettings *gameSettings;

-(id) initInContext:(NSManagedObjectContext *) context;



-(void) playerAttack;

-(void) enemyAttack;

- (void)playerGetsAttackedByEnemy;

- (int)attack;

@end
