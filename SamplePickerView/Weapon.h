//
//  Weapon.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Element, PlayerWeapon;

@interface Weapon : NSManagedObject

@property (nonatomic, retain) NSNumber * damageHigh;
@property (nonatomic, retain) NSNumber * damageLow;
@property (nonatomic, retain) NSString * imageName;
@property (nonatomic, retain) NSDecimalNumber * price;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *playerWeapons;
@property (nonatomic, retain) Element *element;
@end

@interface Weapon (CoreDataGeneratedAccessors)

+(Weapon *) newInContext:(NSManagedObjectContext *)context;

+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context;

+(Weapon *) getWeaponWithTitle:(NSString *)theTitle inContext:(NSManagedObjectContext *)context;

-(void) saveInContext:(NSManagedObjectContext *) context;

- (void)addWeaponPlayerWeaponsObject:(PlayerWeapon *)value;
- (void)removeWeaponPlayerWeaponsObject:(PlayerWeapon *)value;
- (void)addWeaponPlayerWeapons:(NSSet *)values;
- (void)removeWeaponPlayerWeapons:(NSSet *)values;
- (int)getDamage;

@end
