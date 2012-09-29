//
//  WeaponSelectorViewController.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/15/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Weapon.h"
#import "Player.h"
#import "AppDelegate.h"
#import "PlayerWeapon.h"


@interface BattleWeaponSelectorViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *weaponsPickerView;

@property (strong, nonatomic) IBOutlet UILabel *weaponTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponDamageLowLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponDamageHighLabel;

@property (strong, nonatomic) IBOutlet UIImageView *weaponImageView;

@property AppDelegate *appDelegate;

@property NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) IBOutlet UILabel *currentWeaponLabel;

@property Player * player;

@property PlayerWeapon * selectedPlayerWeapon;

@property NSArray * playerWeapons;

- (IBAction)selectWeaponSelected:(id)sender;

@end
