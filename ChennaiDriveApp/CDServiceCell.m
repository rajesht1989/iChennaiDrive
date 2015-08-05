//
//  CDServiceCell.m
//  ChennaiDriveApp
//
//  Created by Rajesh on 5/5/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDServiceCell.h"

@implementation CDServiceCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

+ (CDServiceCell*)getServiceCell{
    CDServiceCell *cell;
    NSArray *topLevelsObjects = [[NSBundle mainBundle] loadNibNamed:@"CDServiceCell" owner:nil options:nil];
    for(id currentObject in topLevelsObjects)
    {
        if([currentObject isKindOfClass:[UITableViewCell class]])
        {
            cell = (CDServiceCell *)currentObject;
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
