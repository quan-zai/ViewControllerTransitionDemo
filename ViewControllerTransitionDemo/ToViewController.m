//
//  ToViewController.m
//  ViewControllerTransitionDemo
//
//  Created by 权仔 on 16/6/12.
//  Copyright © 2016年 XZQ. All rights reserved.
//

#import "ToViewController.h"

@implementation ToViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
        // 毛玻璃视图
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
        //添加到要有毛玻璃特效的控件中
        effectView.frame = self.view.bounds;
    
        [self.view addSubview:effectView];
        //设置模糊透明度
        effectView.alpha = 0.98f;
    
    
    UIButton *preButton = [UIButton buttonWithType:UIButtonTypeSystem];
    preButton.backgroundColor = [UIColor orangeColor];
    
    preButton.frame = CGRectMake(100, 300, 80, 20);
    
    [self.view addSubview:preButton];
    
    [preButton setTitle:@"pre" forState:UIControlStateNormal];
    [preButton setTitleColor:[UIColor blackColor]
                     forState:UIControlStateNormal];
    [preButton addTarget:self
                   action:@selector(preButtonClick)
         forControlEvents:UIControlEventTouchUpInside];
}

- (void)preButtonClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ToViewControllerDidClickDismissButton:)]) {
        [self.delegate ToViewControllerDidClickDismissButton:self];
    }
}

@end
