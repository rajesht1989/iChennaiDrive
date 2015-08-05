/**
 @author OLM
 
 @section Licence
 Copyright 2011, 2012 BNP Paribas Fortis. All rights reserved.
 
 @section Description
 A button who will resize horizontally according to the text inside it
 */

#import "CDStretchableButton.h"

#define MARGIN 15

@implementation CDStretchableButton

/**************************************************************************************************/
#pragma mark - Birth & Death


+ (CDStretchableButton *)stretchableButtonWithImage:(UIImage *)image
                                              frame:(CGRect)frame
                                      localizedString:(NSString *)localizedString
                                             target:(id)target
                                             action:(SEL)action
{
    CDStretchableButton *button = [[CDStretchableButton alloc] initWithFrame:frame];
    [button setTitle:localizedString forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button.titleLabel setFont:fontWithSize(12)];
    [button.titleLabel setTextColor:[UIColor whiteColor]];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        self.originalFrame = frame;
    }
    return self;
}


/**************************************************************************************************/
#pragma mark - Getters & Setters

@synthesize originalFrame;

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    CGSize newSize = [title sizeWithFont:self.titleLabel.font 
                       constrainedToSize:self.originalFrame.size
                           lineBreakMode:self.titleLabel.lineBreakMode];

    CGRect newFrame = CGRectMake(self.frame.origin.x, 
                                 self.frame.origin.y, 
                                 newSize.width + MARGIN, 
                                 self.frame.size.height);
    [self setFrame:newFrame];
}

@end
