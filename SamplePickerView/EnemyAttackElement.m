//
//  EnemyAttackElement.m
//  SamplePickerView
//
//  Created by Miguel Morales on 9/30/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "EnemyAttackElement.h"
#import "Element.h"
#import "Enemy.h"


@implementation EnemyAttackElement

@dynamic enemy;
@dynamic element;

+(EnemyAttackElement *) newInContext:(NSManagedObjectContext *)context {
    EnemyAttackElement * enemyAttackElement = (EnemyAttackElement *) [NSEntityDescription insertNewObjectForEntityForName:@"EnemyAttackElement" inManagedObjectContext:context];
    
    return enemyAttackElement;
}

-(void) saveInContext:(NSManagedObjectContext *) context {
    NSError *error;
    [context save:&error];
    
}
@end
