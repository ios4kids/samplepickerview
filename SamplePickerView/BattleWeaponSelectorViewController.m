//
//  WeaponSelectorViewController.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/15/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "BattleWeaponSelectorViewController.h"


@interface BattleWeaponSelectorViewController ()

@end

@implementation BattleWeaponSelectorViewController


-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [self.appDelegate managedObjectContext];
    
    self.weaponsPickerView.delegate = self;
    self.weaponsPickerView.dataSource = self;
    
    self.playerWeapons = [self.player.playerWeapons allObjects];
    
    [self setSelectedRow];
    
    [self drawWeaponDetails];
    
}

-(void) setSelectedRow {
    NSInteger count = 0;
    for (PlayerWeapon *currentPlayerWeapon in self.playerWeapons) {
        if (currentPlayerWeapon.weapon.title == self.player.selectedPlayerWeapon.weapon.title) {
            self.selectedPlayerWeapon = [self.playerWeapons objectAtIndex:count];
            [self.weaponsPickerView selectRow:count inComponent:0 animated:YES];
        }
        count ++;
    }
}

-(void) viewDidAppear:(BOOL)animated {
    [self setSelectedRow]; //need to call this again in viewDidAppear for the selector to change
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [self.player.playerWeapons.allObjects count];
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    PlayerWeapon *playerWeapon = [self.playerWeapons objectAtIndex:row];
    
    self.selectedPlayerWeapon = playerWeapon;
    [self drawWeaponDetails];
    [self.view setNeedsDisplay];

    
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    PlayerWeapon * playerWeapon = [self.playerWeapons objectAtIndex:row];
    return playerWeapon.weapon.title;
}


-(void) drawWeaponDetails {
    PlayerWeapon *playerWeapon = self.selectedPlayerWeapon;
    if (playerWeapon) {
        self.weaponTitleLabel.text = playerWeapon.weapon.title;
        self.weaponDamageLowLabel.text = [playerWeapon.weapon.damageLow stringValue];
        self.weaponDamageHighLabel.text = [playerWeapon.weapon.damageHigh stringValue];
        
        UIImage *image = [UIImage imageNamed:playerWeapon.weapon.imageName];
        [self.weaponImageView setImage:image];
        
        self.currentWeaponLabel.text = self.player.selectedPlayerWeapon.weapon.title;
        
        [self.view setNeedsDisplay];
        
    }
    else {
        self.weaponTitleLabel.text = @"";
        self.weaponDamageLowLabel.text = @"";
        self.weaponDamageHighLabel.text = @"";
        self.weaponImageView = nil;
    }
}



- (IBAction)selectWeaponSelected:(id)sender {
    
    self.player.selectedPlayerWeapon = self.selectedPlayerWeapon;
    [self.player saveInContext:self.managedObjectContext];
    [self drawWeaponDetails];
}





@end
