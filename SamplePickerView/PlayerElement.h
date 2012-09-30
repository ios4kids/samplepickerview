//
//  PlayerElement.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Element, Player;

@interface PlayerElement : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * weakness;
@property (nonatomic, retain) Player *player;
@property (nonatomic, retain) Element *element;


+(NSArray *) getAllRecordsInContext:(NSManagedObjectContext *)context;

+(PlayerElement *) newInContext:(NSManagedObjectContext *)context;

-(void) saveInContext:(NSManagedObjectContext *) context;

@end
