//
//  UINavigationItem+CDNavigationItem.m
//  ChennaiDriveApp
//
//  Created by Rajesh on 5/11/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "UINavigationItem+CDNavigationItem.h"

@implementation UINavigationItem (CDNavigationItem)

- (void)setTitleViewWithTitle:(NSString*)title{
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 180, 40)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 14, 180, 20)];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:title];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:fontWithSize(18)];
    
    [titleView addSubview:label];
    
    [self setTitleView:titleView];
}

- (UIBarButtonItem*) getBarButtonItemWithImage:(UIImage *)image
                                         title:(NSString *)titleString
                                        target:(id)target
                                        action:(SEL)action{
    
     CGSize sizeOfText = [titleString sizeWithFont:[UIFont boldSystemFontOfSize:14]];
    UIButton *button = [[UIButton alloc]initWithFrame: CGRectMake(0, 0, sizeOfText.width <= 40?50: sizeOfText.width+ 10,30)];
    [button setTitle:titleString forState:UIControlStateNormal];
    [button.titleLabel setFont:fontWithSize(14)];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    return barButton;
}

@end
