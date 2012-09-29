//
//  Element.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Weapon;

@interface Element : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * imageName;

@property (nonatomic, retain) NSManagedObject *elementHasManyPlayerElements;
@property (nonatomic, retain) NSManagedObject *elementHasManyEnemyElements;
@property (nonatomic, retain) Weapon *elementHasManyWeapons;


+(Element *) newInContext:(NSManagedObjectContext *)context;

+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context;

+(Element *) getElementWithName:(NSString *)theName inContext:(NSManagedObjectContext *)context;


-(void) saveInContext:(NSManagedObjectContext *) context;

@end
