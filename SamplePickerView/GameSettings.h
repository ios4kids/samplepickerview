//
//  GameSettings.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/30/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Enemy;

@interface GameSettings : NSManagedObject

@property (nonatomic, retain) Enemy *currentEnemy;

+(GameSettings *) newInContext:(NSManagedObjectContext *)context;

+(GameSettings *) getGameSettingsInContext:(NSManagedObjectContext *)context;

-(void) saveInContext:(NSManagedObjectContext *) context;

-(Enemy *) pickCurrentEnemy;

@end
