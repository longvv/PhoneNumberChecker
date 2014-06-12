//
//  AboutViewController.h
//  PhoneNumberChecker
//
//  Created by Vu Van Long on 6/13/14.
//  Copyright (c) 2014 VVL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnCaller;
@property (weak, nonatomic) IBOutlet UIImageView *authorAvatar;
- (IBAction)callToAuthor:(id)sender;
- (IBAction)btnBackPressed:(id)sender;
@end
