//
//  CDDealerSelectionCell.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/21/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDDealerSelectionCell.h"

@implementation CDDealerSelectionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}


+ (CDDealerSelectionCell*)getDealerSelectionCell{
    CDDealerSelectionCell *cell;
    NSArray *topLevelsObjects = [[NSBundle mainBundle] loadNibNamed:@"CDDealerSelectionCell" owner:nil options:nil];
    for(id currentObject in topLevelsObjects)
    {
        if([currentObject isKindOfClass:[UITableViewCell class]])
        {
            cell = (CDDealerSelectionCell *)currentObject;
            break;
        }
    }
    return cell;
}

- (void)designCellWithDictionary:(NSDictionary*)dict{
    [self.dealerImage setImage:[UIImage imageNamed:[dict objectForKey:@"dealerType"]]];
    [self.nameLabel setText:[dict objectForKey:@"name"]];
    [self.addressLabel setText:[dict objectForKey:@"address"]];
    [self.phoneNumLabel setText:[dict objectForKey:@"phone"]];
    [self.ratingImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ Star",[dict objectForKey:@"rating"]]]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
