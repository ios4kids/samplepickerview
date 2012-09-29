//
//  EnemyElement.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Element, Enemy;

@interface EnemyElement : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * weakness;
@property (nonatomic, retain) Enemy *enemyElementBelongsToEnemy;
@property (nonatomic, retain) Element *enemyElementBelongsToElement;


+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context;

+(EnemyElement *) newInContext:(NSManagedObjectContext *)context;

-(void) saveInContext:(NSManagedObjectContext *) context;

@end
