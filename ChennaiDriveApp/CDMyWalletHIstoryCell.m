//
//  CDMyWalletHIstoryCell.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDMyWalletHIstoryCell.h"

@implementation CDMyWalletHIstoryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

+ (CDMyWalletHIstoryCell*)getMyWalletHistoryCell{
    CDMyWalletHIstoryCell *cell;
    NSArray *topLevelsObjects = [[NSBundle mainBundle] loadNibNamed:@"CDMyWalletHIstoryCell" owner:nil options:nil];
    for(id currentObject in topLevelsObjects)
    {
        if([currentObject isKindOfClass:[UITableViewCell class]])
        {
            cell = (CDMyWalletHIstoryCell *)currentObject;
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
