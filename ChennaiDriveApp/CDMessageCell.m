//
//  CDMessageCell.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 5/26/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDMessageCell.h"

@implementation CDMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}


+ (CDMessageCell*)getMessageCell{
    CDMessageCell *cell;
    NSArray *topLevelsObjects = [[NSBundle mainBundle] loadNibNamed:@"CDMessageCell" owner:nil options:nil];
    for(id currentObject in topLevelsObjects)
    {
        if([currentObject isKindOfClass:[UITableViewCell class]])
        {
            cell = (CDMessageCell*)currentObject;
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
