//
//  Enemy.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Enemy : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * imageName;
@property (nonatomic, retain) NSNumber * damageLow;
@property (nonatomic, retain) NSNumber * damageHigh;
@property (nonatomic, retain) NSNumber * health;
@property (nonatomic, retain) NSSet *enemyHasManyEnemyElements;
@end

@interface Enemy (CoreDataGeneratedAccessors)

+(Enemy *) newInContext:(NSManagedObjectContext *)context;

+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context;

+(Enemy *) getEnemyWithName:(NSString *)theName inContext:(NSManagedObjectContext *)context;

-(void) saveInContext:(NSManagedObjectContext *) context;

- (void)addEnemyHasManyEnemyElementsObject:(NSManagedObject *)value;
- (void)removeEnemyHasManyEnemyElementsObject:(NSManagedObject *)value;
- (void)addEnemyHasManyEnemyElements:(NSSet *)values;
- (void)removeEnemyHasManyEnemyElements:(NSSet *)values;

@end
