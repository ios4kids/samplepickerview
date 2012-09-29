//
//  BattleViewController.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/15/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "BattleViewController.h"
#import "BattleWeaponSelectorViewController.h"
#import "Fight.h"

@interface BattleViewController ()

@end

@implementation BattleViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    GameSettings * gameSettings = [GameSettings getGameSettingsInContext:[self.appDelegate managedObjectContext]];
    
    self.currentEnemy = [gameSettings pickCurrentEnemy];
    
    self.player = [Player getPlayerInContext:[self.appDelegate managedObjectContext]];
    
    [self.playerImageView setImage:[UIImage imageNamed:self.player.imageName]];
    [self.enemyImageView setImage:[UIImage imageNamed:self.currentEnemy.imageName]];
    self.enemyHealth.text = [self.currentEnemy.health stringValue];

    self.playerHealthLabel.text = [self.player.health stringValue];
    
    self.currentPlayerWeaponLabel.text = self.player.playerHasOneSelectedPlayerWeapon.playerWeaponBelongsToWeapon.title;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"battleToWeaponsController"]) {
        BattleWeaponSelectorViewController * controller = [segue destinationViewController];
        controller.player = self.player;
        controller.appDelegate = self.appDelegate;
    }

}

- (IBAction)fightButtonPressed:(id)sender {
    Fight *fight = [[Fight alloc] initInContext:[self.appDelegate managedObjectContext]];
    
    [fight playerAttack];
    [fight enemyAttack];
    
}
@end
