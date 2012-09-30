//
//  GameSettings.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/30/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "GameSettings.h"
#import "Enemy.h"


@implementation GameSettings

@dynamic currentEnemy;

+(GameSettings *) newInContext:(NSManagedObjectContext *)context {
    GameSettings * gameSettings = (GameSettings *) [NSEntityDescription insertNewObjectForEntityForName:@"GameSettings" inManagedObjectContext:context];
    
    return gameSettings;
}

+(GameSettings *) getGameSettingsInContext:(NSManagedObjectContext *)context {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GameSettings"];
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    if([array count]>0) {
        return [array objectAtIndex:0];
    }
    else {
        return nil;
    }
    
}

-(void) saveInContext:(NSManagedObjectContext *) context {
    NSError *error;
    [context save:&error];
    
}

-(Enemy *) pickCurrentEnemy {
    //TODO need to pick a random enemy and set him
    return self.currentEnemy;
}

@end
