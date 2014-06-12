//
//  AboutViewController.m
//  PhoneNumberChecker
//
//  Created by Vu Van Long on 6/13/14.
//  Copyright (c) 2014 VVL. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // corner radius for avatar
    self.authorAvatar.layer.cornerRadius = self.authorAvatar.frame.size.width/2;
    self.authorAvatar.layer.masksToBounds = YES;
    self.authorAvatar.layer.borderWidth = 0;
    
    // corner radius for button
    self.btnCaller.layer.cornerRadius = 10;
    self.btnCaller.layer.masksToBounds = YES;
    self.btnCaller.layer.borderWidth = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)callToAuthor:(id)sender {
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:130-032-2837"]]];
    } else {
        UIAlertView *notPermitted=[[UIAlertView alloc] initWithTitle:@"Sorry" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [notPermitted show];
    }
}

- (IBAction)btnBackPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
