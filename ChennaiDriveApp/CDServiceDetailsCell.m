//
//  CDServiceDetailsCell.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/20/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDServiceDetailsCell.h"

@implementation CDServiceDetailsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

+ (CDServiceDetailsCell*)getServiceDetailsCell{
    CDServiceDetailsCell *cell;
    NSArray *topLevelsObjects = [[NSBundle mainBundle] loadNibNamed:@"CDServiceDetailsCell" owner:nil options:nil];
    for(id currentObject in topLevelsObjects)
    {
        if([currentObject isKindOfClass:[UITableViewCell class]])
        {
            cell = (CDServiceDetailsCell *)currentObject;
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
