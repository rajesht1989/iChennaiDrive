//
//  CDCell.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDTableCellWithInfo.h"

#define CDTableCellWithInfoIdentifier @"CDTableCellWithInfo"

@implementation CDTableCellWithInfo

@synthesize textField;
@synthesize infoButton;
@synthesize delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}


#pragma mark - UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)theTextField
{
    [theTextField setTextColor:[UIColor blackColor]];
}



- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [self.delegate registrationCellWithInfo:self textFieldValueChanged:self.textField];
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [self.delegate textFieldShouldReturn:self.textField];
}



+ (CDTableCellWithInfo*)cellWithInfo{
    CDTableCellWithInfo *cell;
    NSArray *topLevelsObjects = [[NSBundle mainBundle] loadNibNamed:CDTableCellWithInfoIdentifier owner:nil options:nil];
    for(id currentObject in topLevelsObjects)
    {
        if([currentObject isKindOfClass:[UITableViewCell class]])
        {
            cell = (CDTableCellWithInfo *)currentObject;
            break;
        }
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
