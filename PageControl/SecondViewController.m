//
//  SecondViewController.m
//  PageControl
//
//  Created by el1ven on 14-3-20.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import "SecondViewController.h"
#import "JSONKit.h"
#import "ThirdViewController.h"
#import "DXAlertView.h"



@interface SecondViewController ()


@end

@implementation SecondViewController

@synthesize page2_login_user;
@synthesize page2_login_pwd;


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
    //[self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)page2_login_user_keyboard:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)page2_login_pwd_keyboard:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)page2_enter:(id)sender {
    NSString *userName = self.page2_login_user.text;
    NSString *userPwd = self.page2_login_pwd.text;//获取用户的输入值
    NSString *strUrl = @"http://127.0.0.1/TreeMap/login.php";
    
    NSDictionary *userInfo = @{@"userName":userName,@"userPwd":userPwd};//把用户信息存到NSDictionary中
    
    //[self postHttpUrl:strUrl postInfo:userInfo];//传递参数，调用函数
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:strUrl parameters:userInfo success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"登录验证返回的数据: %@", responseStr);
        if([responseStr  isEqual: @"success"]){
            
            //[self performSelector:@selector(moveTo) withObject:nil afterDelay:0.1];
            [self performSegueWithIdentifier:@"pushToThird" sender:sender];
            
            //[self.navigationController pushViewController:@"ThirdViewController" animated:YES];
            
        }else{
            //第三方类库实现的alert弹出框
            DXAlertView *alert = [[DXAlertView alloc] initWithTitle:@"Sorry!" contentText:@"Incorrect username or password" leftButtonTitle:nil rightButtonTitle:@"Once Again"];
            [alert show];
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];


    
}

/*-(void)postHttpUrl:(NSString *)urlString postInfo:(NSDictionary *)info{
    if(info == nil || [info count] <= 0){
        return;//如果信息为空则不提交
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:urlString parameters:info success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"登录验证返回的数据: %@", responseStr);
        if([responseStr  isEqual: @"success"]){
            
            //[self performSelector:@selector(moveTo) withObject:nil afterDelay:0.1];
            [self performSegueWithIdentifier:@"pushToThird" sender:nil];
            
             //[self.navigationController pushViewController:@"ThirdViewController" animated:YES];
            
        }else{
            //第三方类库实现的alert弹出框
            DXAlertView *alert = [[DXAlertView alloc] initWithTitle:@"Sorry!" contentText:@"Incorrect username or password" leftButtonTitle:nil rightButtonTitle:@"Once Again"];
            [alert show];
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}*/

- (IBAction)page2_register:(id)sender {
}

/*-(void)moveTo{
    ThirdViewController *threeView = [[ThirdViewController alloc] init];
    //[threeView loadView];
    [threeView.view setBackgroundColor:[UIColor groupTableViewBackgroundColor ]];
    [self.navigationController pushViewController:threeView animated:YES];
    //[ popToRootViewControllerAnimated:FALSE];
    
    
}*/


@end
