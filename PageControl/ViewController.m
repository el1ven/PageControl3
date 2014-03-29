//
//  ViewController.m
//  PageControl
//
//  Created by el1ven on 14-3-18.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize scrollView;
@synthesize slideImages;
@synthesize pageControl;
@synthesize textField;
//@synthesize startButton;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *nib  = [[NSBundle mainBundle]loadNibNamed:@"ScrollView" owner:self options:nil];//获得nib视图数组
    scrollView = [nib objectAtIndex:0];//得到UIView
    
    scrollView.bounces = YES;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;//实现了一个代理
    scrollView.userInteractionEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    CGRect startView = [[UIScreen mainScreen]bounds];//获取当前屏幕的Frame
    [scrollView setCenter:CGPointMake(startView.size.width/2, startView.size.height/4)];////设置自定义视图的中点为屏幕的中点
    [self.view addSubview:scrollView];//添加视图
    
    //添加按钮
    /*startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [startButton setTitle:@"Start Trip" forState:UIControlStateNormal];
    startButton.frame = CGRectMake(90, 420, 150, 20);
    [self.view addSubview:startButton];
    [startButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];*/
    
    
    //添加计时器循环,触发runTimePage
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
    
    //初始化图片数组
    slideImages = [[NSMutableArray alloc]init];
    [slideImages addObject:@"page1_pic1.jpg"];
    [slideImages addObject:@"page1_pic2.png"];
    [slideImages addObject:@"page1_pic1.jpg"];
    [slideImages addObject:@"page1_pic2.png"];
    
    //设置pageControl控件样式
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(110,380,100,18)];
    [pageControl setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [pageControl setPageIndicatorTintColor:[UIColor blackColor]];
    pageControl.numberOfPages = [slideImages count];
    pageControl.currentPage = 0;
    [pageControl addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged];// 触摸mypagecontrol触发change这个方法事件
    
    [self.view addSubview:pageControl];//添加控件
    
    //给scrollView添加slideImages中的图片,利用for循环
    for(int i = 0; i < [slideImages count]; i++){
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[slideImages objectAtIndex:i]]];
        imageView.frame = CGRectMake(320+(320*i),100, 320, 460);
        [scrollView addSubview:imageView];
    }
    
    //取数组最后一张图片，放在第0页
    UIImageView *imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[slideImages objectAtIndex:([slideImages count]-1)]]];
    imageView0.frame = CGRectMake(0,0, 320,460);
    [scrollView addSubview:imageView0];
                                  
    //取数组第一张图片，放在最后一页
    UIImageView *imageView5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[slideImages objectAtIndex:0]]];
    imageView5.frame = CGRectMake((320 * ([slideImages count] + 1)),0, 320,460);
    [scrollView addSubview:imageView5];
                                  
    [scrollView setContentSize:CGSizeMake(320 * ([slideImages count] + 2), 460)]; //  +上第1页和第4页  原理：4-[1-2-3-4]-1
    [scrollView setContentOffset:CGPointMake(0, 0)];
    [scrollView scrollRectToVisible:CGRectMake(320,0,320,460) animated:NO]; // 默认从序号1位置放第1页 ，序号0位置位置放第4页
                                  
}
    
    //scrollView 委托函数
-(void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth/([slideImages count]+2))/pageWidth)+1;
    page--; //默认从第二页开始
    pageControl.currentPage = page;
}

//scrollView 委托函数
- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int currentPage = floor((self.scrollView.contentOffset.x - pageWidth/ ([slideImages count]+2)) / pageWidth) + 1;
    
    if (currentPage == 0)
    {
        [self.scrollView scrollRectToVisible:CGRectMake(320 * [slideImages count],0,320,460) animated:NO]; // 序号0 最后1页
    }
    else if (currentPage == ([slideImages count]+1))
    {
        [self.scrollView scrollRectToVisible:CGRectMake(320,0,320,460) animated:NO]; // 最后+1,循环第1页
    }

}

//pageControl选择器的方法：
-(void)turnPage
{
    int page = pageControl.currentPage;
    [self.scrollView scrollRectToVisible:CGRectMake(320*(page+1),0,320,460) animated:NO]; // 触摸pagecontroller那个点点 往后翻一页 +1
}

//定时器方法
-(void)runTimePage
{
    int page = pageControl.currentPage;
    page++;
    page = page > 3 ? 0 : page;
    pageControl.currentPage = page;
    [self turnPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击按钮跳转到下一页

- (IBAction)startButton:(id)sender {
    
}
@end
