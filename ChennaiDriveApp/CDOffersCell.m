//
//  CDOffersCell.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 5/26/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDOffersCell.h"

@implementation CDOffersCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

+ (CDOffersCell*)getOffersCell{
    CDOffersCell *cell;
    NSArray *topLevelsObjects = [[NSBundle mainBundle] loadNibNamed:@"CDOffersCell" owner:nil options:nil];
    for(id currentObject in topLevelsObjects)
    {
        if([currentObject isKindOfClass:[UITableViewCell class]])
        {
            cell = (CDOffersCell*)currentObject;
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
