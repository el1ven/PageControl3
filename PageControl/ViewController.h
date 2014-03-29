//
//  ViewController.h
//  PageControl
//
//  Created by el1ven on 14-3-18.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>


@property (strong,nonatomic)UIScrollView *scrollView;
@property (strong,nonatomic)NSMutableArray *slideImages;
@property (strong,nonatomic)UIPageControl *pageControl;
@property (strong,nonatomic)UITextField *textField;

- (IBAction)startButton:(id)sender;




@end
