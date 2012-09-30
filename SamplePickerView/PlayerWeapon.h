//
//  PlayerWeapon.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Player, Weapon;

@interface PlayerWeapon : NSManagedObject

@property (nonatomic, retain) NSNumber * quantity;
@property (nonatomic, retain) Player *player;
@property (nonatomic, retain) Weapon *weapon;

@property (nonatomic, retain) Player *currentlySelectedByPlayer;


+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context;

+(PlayerWeapon *) newInContext:(NSManagedObjectContext *)context;

-(void) saveInContext:(NSManagedObjectContext *) context;

@end
