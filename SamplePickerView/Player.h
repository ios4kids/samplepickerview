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
#import "Element.h"
#import "PlayerWeapon.h"
#import "PlayerElement.h"


@interface Player : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * imageName;
@property (nonatomic, retain) NSNumber * health;
@property (nonatomic, retain) NSDecimalNumber * money;
@property (nonatomic, retain) NSNumber * strength;
@property (nonatomic, retain) NSSet *playerHasManyPlayerWeapons;
@property (nonatomic, retain) NSSet *playerHasManyPlayerElements;

@property (nonatomic, retain) PlayerWeapon *playerHasOneSelectedPlayerWeapon;

@end

@interface Player (CoreDataGeneratedAccessors)


+(Player *) newInContext:(NSManagedObjectContext *)context;

+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context;

+(Player *) getPlayerInContext:(NSManagedObjectContext *)context;

-(float) getWeaknessForElement:(Element *) theElement;

-(void) saveInContext:(NSManagedObjectContext *) context;

- (void)addPlayerHasManyPlayerWeaponsObject:(PlayerWeapon *)value;
- (void)removePlayerHasManyPlayerWeaponsObject:(PlayerWeapon *)value;
- (void)addPlayerHasManyPlayerWeapons:(NSSet *)values;
- (void)removePlayerHasManyPlayerWeapons:(NSSet *)values;

- (void)addPlayerHasManyPlayerElementsObject:(NSManagedObject *)value;
- (void)removePlayerHasManyPlayerElementsObject:(NSManagedObject *)value;
- (void)addPlayerHasManyPlayerElements:(NSSet *)values;
- (void)removePlayerHasManyPlayerElements:(NSSet *)values;




@end
