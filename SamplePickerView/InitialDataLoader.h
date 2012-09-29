//
//  InitialDataLoader.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weapon.h"
#import "Player.h"
#import "PlayerWeapon.h"
#import "PlayerElement.h"
#import "Element.h"
#import "Enemy.h"
#import "EnemyElement.h"
#import "GameSettings.h"

@interface InitialDataLoader : NSObject


@property NSManagedObjectContext * managedObjectContext;

-(id) initWithContext:(NSManagedObjectContext *) context;

-(void) loadAll;

@end
