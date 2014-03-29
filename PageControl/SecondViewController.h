//
//  SecondViewController.h
//  PageControl
//
//  Created by el1ven on 14-3-20.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *page2_login_user;
@property (strong, nonatomic) IBOutlet UITextField *page2_login_pwd;

- (IBAction)page2_login_user_keyboard:(id)sender;
- (IBAction)page2_login_pwd_keyboard:(id)sender;
- (IBAction)page2_enter:(id)sender;//Let's Enter的按钮
- (IBAction)page2_register:(id)sender;
//Fresh Register按钮
@end
