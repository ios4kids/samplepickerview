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

@interface Fight : NSObject

@property NSManagedObjectContext * managedObjectContext;

-(id) initInContext:(NSManagedObjectContext *) context;

-(void) playerAttack;

-(void) enemyAttack;

@end
