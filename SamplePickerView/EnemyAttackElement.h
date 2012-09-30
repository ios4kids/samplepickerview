//
//  EnemyAttackElement.h
//  SamplePickerView
//
//  Created by Miguel Morales on 9/30/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Element, Enemy;

@interface EnemyAttackElement : NSManagedObject

@property (nonatomic, retain) Enemy *enemy;
@property (nonatomic, retain) Element *element;

+(EnemyAttackElement *) newInContext:(NSManagedObjectContext *)context;

-(void) saveInContext:(NSManagedObjectContext *) context;


@end
