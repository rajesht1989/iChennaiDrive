/**
 @author OLM
 
 @section Licence
 Copyright 2011, 2012 BNP Paribas Fortis. All rights reserved.
 
 @section Description
 */

#import <UIKit/UIKit.h>


@interface CDStretchableButton : UIButton
{
    CGRect originalFrame;
}

/**************************************************************************************************/
#pragma mark - Birth & Death

+ (CDStretchableButton *)stretchableButtonWithImage:(UIImage *)image
                                              frame:(CGRect)frame
                                      localizedString:(NSString *)localizedString
                                             target:(id)target
                                             action:(SEL)action;


/**************************************************************************************************/
#pragma mark - Getters & Setters

@property (assign) CGRect originalFrame;

@end
