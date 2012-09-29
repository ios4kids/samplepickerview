//
//  StoreViewController.m
//  SamplePickerView
//
//  Created by Alberto Morales on 9/16/12.
//  Copyright (c) 2012 Alberto Morales. All rights reserved.
//

#import "StoreWeaponViewController.h"

@interface StoreWeaponViewController ()

@end

@implementation StoreWeaponViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [self.appDelegate managedObjectContext];
    self.player = [Player getPlayerInContext:self.managedObjectContext];
    
    
    self.weaponsPickerView.delegate = self;
    self.weaponsPickerView.dataSource = self;
    
    self.weapons = [Weapon getAllRecordsInContext:[self.appDelegate managedObjectContext]];
    
    if ([self.weapons count] > 0) {
        self.selectedWeapon = [self.weapons objectAtIndex:0];
    }
    
    [self drawWeaponDetails];
    
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


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return ([self.weapons count]);
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    Weapon *weapon = [self.weapons objectAtIndex:row];
    
    self.selectedWeapon = weapon;
    [self drawWeaponDetails];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    Weapon * weapon = [self.weapons objectAtIndex:row];
    return weapon.title;
}


-(void) drawWeaponDetails {
    Weapon *weapon = self.selectedWeapon;
    if (weapon) {
        self.weaponTitleLabel.text = weapon.title;
        self.weaponDamageLowLabel.text = [weapon.damageLow stringValue];
        self.weaponDamageHighLabel.text = [weapon.damageHigh stringValue];
        self.weaponPriceLabel.text = [NSNumberFormatter localizedStringFromNumber:weapon.price numberStyle:NSNumberFormatterCurrencyStyle];
        
        UIImage *image = [UIImage imageNamed:weapon.imageName];
        [self.weaponImageView setImage:image];
        
        self.playerMoneyLabel.text =   [NSNumberFormatter localizedStringFromNumber:self.player.money numberStyle:NSNumberFormatterCurrencyStyle];
        
        [self.view setNeedsDisplay];
        
    }
    else {
        self.weaponTitleLabel.text = @"";
        self.weaponDamageLowLabel.text = @"";
        self.weaponDamageHighLabel.text = @"";
        self.weaponPriceLabel.text = @"";
        self.weaponImageView = nil;
    }
}

- (IBAction)buyButtonPressed:(id)sender {
    Store *store = [[Store alloc] initWithContext:self.managedObjectContext];
    store.player = self.player;
    store.weapon = self.selectedWeapon;
    if ([store canMakePurchase]) {
        [store makePurchase];
        [self drawWeaponDetails];
    }
    else {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Cannot Buy" message:store.errorMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [message show];
    }
}
@end
