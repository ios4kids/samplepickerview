//
//  BattleViewController.h
//  SamplePickerView
//
//  Created by Alberto Morales on 9/15/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Enemy.h"
#import "GameSettings.h"
#import "AppDelegate.h"
#import "Player.h"

@interface BattleViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *playerImageView;
@property (strong, nonatomic) IBOutlet UIImageView *enemyImageView;
@property (strong, nonatomic) IBOutlet UILabel *playerHealthLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentPlayerWeaponLabel;
@property (weak, nonatomic) IBOutlet UILabel *enemyHealth;


@property Enemy * currentEnemy;
@property Player * player;

@property AppDelegate * appDelegate;
- (IBAction)fightButtonPressed:(id)sender;

@end
