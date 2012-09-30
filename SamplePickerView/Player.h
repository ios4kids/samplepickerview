//
//  Player.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Weapon.h"
#import "PlayerWeapon.h"

@class PlayerWeapon;

@interface Player : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * imageName;
@property (nonatomic, retain) NSNumber * health;
@property (nonatomic, retain) NSDecimalNumber * money;
@property (nonatomic, retain) NSNumber * strength;
@property (nonatomic, retain) NSSet *playerWeapons;
@property (nonatomic, retain) NSSet *playerElements;

@property (nonatomic, retain) PlayerWeapon *selectedPlayerWeapon;

@end

@interface Player (CoreDataGeneratedAccessors)


+(Player *) newInContext:(NSManagedObjectContext *)context;

+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context;

+(Player *) getPlayerInContext:(NSManagedObjectContext *)context;

-(void) saveInContext:(NSManagedObjectContext *) context;

- (void)addPlayePlayerWeaponsObject:(PlayerWeapon *)value;
- (void)removePlayerPlayerWeaponsObject:(PlayerWeapon *)value;
- (void)addPlayerPlayerWeapons:(NSSet *)values;
- (void)removePlayerPlayerWeapons:(NSSet *)values;

- (void)addPlayerPlayerElementsObject:(NSManagedObject *)value;
- (void)removePlayerPlayerElementsObject:(NSManagedObject *)value;
- (void)addPlayerPlayerElements:(NSSet *)values;
- (void)removePlayerPlayerElements:(NSSet *)values;

@end
