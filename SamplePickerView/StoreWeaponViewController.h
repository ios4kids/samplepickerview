//
//  StoreViewController.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weapon.h"
#import "AppDelegate.h"
#import "Player.h"
#import "Store.h"
@interface StoreWeaponViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *weaponsPickerView;

@property (strong, nonatomic) IBOutlet UILabel *weaponTitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *weaponDamageLowLabel;

@property (strong, nonatomic) IBOutlet UILabel *weaponDamageHighLabel;

@property (strong, nonatomic) IBOutlet UILabel *weaponPriceLabel;

@property (strong, nonatomic) IBOutlet UIImageView *weaponImageView;

@property (strong, nonatomic) IBOutlet UILabel *playerMoneyLabel;

@property NSManagedObjectContext * managedObjectContext;

@property Weapon * selectedWeapon;

@property NSArray * weapons;

@property Player * player;

@property AppDelegate *appDelegate;

- (IBAction)buyButtonPressed:(id)sender;

@end
