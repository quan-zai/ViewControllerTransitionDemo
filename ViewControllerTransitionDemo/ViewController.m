//
//  ViewController.m
//  ViewControllerTransitionDemo
//
//  Created by 权仔 on 16/6/12.
//  Copyright © 2016年 XZQ. All rights reserved.
//

#import "ViewController.h"

#import "ToViewController.h"
#import "PresentAnimation.h"

@interface ViewController () <ToViewControllerDelegate, UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) PresentAnimation *presentAnimation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _presentAnimation = [PresentAnimation new];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
    nextButton.backgroundColor = [UIColor orangeColor];
    
    nextButton.frame = CGRectMake(100, 300, 80, 20);
    
    [self.view addSubview:nextButton];
    
    [nextButton setTitle:@"next" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor blackColor]
                     forState:UIControlStateNormal];
    [nextButton addTarget:self
                   action:@selector(nextButtonClick)
         forControlEvents:UIControlEventTouchUpInside];
}

- (void)nextButtonClick
{
    ToViewController *vc = [[ToViewController alloc] init];
    vc.delegate = self;
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    vc.transitioningDelegate = self;
    
    [self presentViewController:vc
                       animated:YES
                     completion:^{
    
    }];
}

#pragma mark - ToViewControllerDelegate -

- (void)ToViewControllerDidClickDismissButton:(ToViewController *)viewController
{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate -

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return nil;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return nil;
}


@end
