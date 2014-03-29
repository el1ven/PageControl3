//
//  ThirdViewController.m
//  PageControl
//
//  Created by el1ven on 14-3-24.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

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
    // Do any additional setup after loading the view.
    self.submit_btn = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    self.submit_btn.frame = CGRectMake(90, 220, 160, 40);
    self.submit_btn.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    self.submit_btn.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    self.submit_btn.radius = 8.0;
    self.submit_btn.margin = 4.0;
    self.submit_btn.depth = 3.0;
    
    self.submit_btn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.submit_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.submit_btn setTitle:@"Submit" forState:UIControlStateNormal];
    
    
    //添加按钮触发事件
    [self.submit_btn addTarget:self action:@selector(Submit:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.submit_btn];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Submit:(id)sender{
    
    DXAlertView *alert = [[DXAlertView alloc] initWithTitle:@"Test!" contentText:@"Incorrect username or password" leftButtonTitle:@"haha" rightButtonTitle:@"Once Again"];
    [alert show];
    
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
