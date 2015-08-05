//
//  PickerComponent.m
//  keyChain
//
//  Created by Rajesh on 3/28/13.
//  Copyright (c) 2013 TCS. All rights reserved.
//

#import "CDPickerComponent.h"

@implementation CDPickerComponent

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self =  [[[NSBundle mainBundle] loadNibNamed:@"CDPickerComponent" owner:self options:nil]objectAtIndex:0];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
