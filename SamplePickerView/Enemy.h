//
//  Enemy.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/30/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Player.h"

@class EnemyElement, GameSettings;

@interface Enemy : NSManagedObject

@property (nonatomic, retain) NSNumber * damageHigh;
@property (nonatomic, retain) NSNumber * damageLow;
@property (nonatomic, retain) NSNumber * health;
@property (nonatomic, retain) NSString * imageName;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *enemyElements;
@property (nonatomic, retain) GameSettings *gameSetting;
@end

@interface Enemy (CoreDataGeneratedAccessors)

+(Enemy *) newInContext:(NSManagedObjectContext *)context;

+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context;

+(Enemy *) getEnemyWithName:(NSString *)theName inContext:(NSManagedObjectContext *)context;

-(void) saveInContext:(NSManagedObjectContext *) context;

-(void) getsAttackedByPlayer: (Player *)thePlayer andWeapon: (Weapon *) theWeapon andContext: (NSManagedObjectContext *) theContext;

-(float) getWeaknessForElement:(Element *) theElement;


- (void)addEnemyElementsObject:(EnemyElement *)value;
- (void)removeEnemyElementsObject:(EnemyElement *)value;
- (void)addEnemyElements:(NSSet *)values;
- (void)removeEnemyElements:(NSSet *)values;

@end
