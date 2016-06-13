//
//  PresentAnimation.m
//  ViewControllerTransitionDemo
//
//  Created by 权仔 on 16/6/13.
//  Copyright © 2016年 XZQ. All rights reserved.
//

#import "PresentAnimation.h"

@implementation PresentAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
//    toViewController.view.frame = CGRectMake(50, 100, screenBounds.size.width - 100, screenBounds.size.height - 200);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toViewController.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            toViewController.view.frame = finalFrame;
                        } completion:^(BOOL finished) {
                            [transitionContext completeTransition:YES];
                        }]; 
}


@end
