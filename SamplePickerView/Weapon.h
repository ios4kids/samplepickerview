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
@property (nonatomic, retain) NSSet *weaponHasManyPlayerWeapons;
@property (nonatomic, retain) Element *weaponBelongsToElement;
@end

@interface Weapon (CoreDataGeneratedAccessors)

+(Weapon *) newInContext:(NSManagedObjectContext *)context;

+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context;

+(Weapon *) getWeaponWithTitle:(NSString *)theTitle inContext:(NSManagedObjectContext *)context;

-(void) saveInContext:(NSManagedObjectContext *) context;

- (void)addWeaponHasManyPlayerWeaponsObject:(PlayerWeapon *)value;
- (void)removeWeaponHasManyPlayerWeaponsObject:(PlayerWeapon *)value;
- (void)addWeaponHasManyPlayerWeapons:(NSSet *)values;
- (void)removeWeaponHasManyPlayerWeapons:(NSSet *)values;

@end
