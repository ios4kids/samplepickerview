//
//  Store.h
//  SamplePickerView
//
//  Created by Miguel Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Weapon.h"


@interface Store : NSObject

@property Player *player;
@property Weapon *weapon;
@property NSString *errorMessage;
@property NSManagedObjectContext *managedObjectContext;

-(id) initWithContext:(NSManagedObjectContext *) context;

-(BOOL)canMakePurchase;

-(void)makePurchase;

@end
