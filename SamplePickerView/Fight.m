//
//  Fight.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "Fight.h"

@implementation Fight

-(id) initInContext:(NSManagedObjectContext *)context {
    self = [super init];
    self.managedObjectContext = context;
    return self;
}

-(void) playerAttack {
    NSLog(@"Here we put the player attack");
}

-(void) enemyAttack {
    NSLog(@"Here we add the enemy attack");
}

@end
