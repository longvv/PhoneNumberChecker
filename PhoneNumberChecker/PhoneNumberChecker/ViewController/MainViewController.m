//
//  ViewController.m
//  PhoneNumberChecker
//
//  Created by Vu Van Long on 6/12/14.
//  Copyright (c) 2014 VVL. All rights reserved.
//

#import "MainViewController.h"
#import "NBPhoneNumberUtil.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // corner radius for button
    self.btnCheck.layer.cornerRadius = 5;
    self.btnCheck.layer.masksToBounds = YES;
    self.btnCheck.layer.borderWidth = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)countryPicker:(__unused CountryPicker *)picker didSelectCountryWithName:(NSString *)name code:(NSString *)code
{
    self.countryNameSelected = name;
    self.countryCodeSelected = code;
}

- (IBAction)checkPhoneNumberInfor:(id)sender {
    
    [self.view endEditing:YES];
    NBPhoneNumberUtil *phoneUtil = [NBPhoneNumberUtil sharedInstance];
    
    NSError *aError = nil;
    NBPhoneNumber *myNumber = [phoneUtil parse:self.phoneNumberField.text
                                 defaultRegion:self.countryCodeSelected error:&aError];
    
    if (aError == nil) {
        // Should check error
        NSLog(@"isValidPhoneNumber ? [%@]", [phoneUtil isValidNumber:myNumber] ? @"YES":@"NO");
        
        // E164          : +436766077303
        self.e164Infor.text = [phoneUtil format:myNumber
                                   numberFormat:NBEPhoneNumberFormatE164
                                          error:&aError];
        // INTERNATIONAL : +43 676 6077303
        self.internationalInfor.text = [phoneUtil format:myNumber
                                            numberFormat:NBEPhoneNumberFormatINTERNATIONAL
                                                   error:&aError];
        // NATIONAL      : 0676 6077303
        self.nationalInfo.text = [phoneUtil format:myNumber
                                      numberFormat:NBEPhoneNumberFormatNATIONAL
                                             error:&aError];
        // RFC3966       : tel:+43-676-6077303
        self.rfc3966Info.text = [phoneUtil format:myNumber
                                     numberFormat:NBEPhoneNumberFormatRFC3966
                                            error:&aError];
        
        [self.inforView setHidden:NO];
    } else {
        NSLog(@"Error: %@", [aError localizedDescription]);
        UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"Sorry, Your phone number is invalid. Please try again!"]
                                                            delegate:self
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil, nil];
        [errorAlert show];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    [self.inforView setHidden:YES];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    [self.inforView setHidden:YES];
    return YES;
}

@end
