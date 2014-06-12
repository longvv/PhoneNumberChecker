//
//  ViewController.h
//  PhoneNumberChecker
//
//  Created by Vu Van Long on 6/12/14.
//  Copyright (c) 2014 VVL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryPicker.h"

@interface MainViewController : UIViewController <UITextFieldDelegate, CountryPickerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnCheck;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UIView *inforView;
@property (weak, nonatomic) IBOutlet UILabel *e164Infor;
@property (weak, nonatomic) IBOutlet UILabel *internationalInfor;
@property (weak, nonatomic) IBOutlet UILabel *nationalInfo;
@property (weak, nonatomic) IBOutlet UILabel *rfc3966Info;

@property (strong, nonatomic) NSString* countryNameSelected;
@property (strong, nonatomic) NSString* countryCodeSelected;

- (IBAction)checkPhoneNumberInfor:(id)sender;
@end
