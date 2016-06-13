//
//  ToViewController.h
//  ViewControllerTransitionDemo
//
//  Created by 权仔 on 16/6/12.
//  Copyright © 2016年 XZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ToViewController;
@protocol ToViewControllerDelegate <NSObject>

- (void)ToViewControllerDidClickDismissButton:(ToViewController *)viewController;

@end

@interface ToViewController : UIViewController

@property (nonatomic, weak) id<ToViewControllerDelegate> delegate;

@end
