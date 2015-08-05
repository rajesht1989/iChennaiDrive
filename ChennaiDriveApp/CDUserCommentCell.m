//
//  CDUserCommentCell.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/21/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDUserCommentCell.h"

@implementation CDUserCommentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

+ (CDUserCommentCell*)getUserCommentCell{
    CDUserCommentCell *cell;
    NSArray *topLevelsObjects = [[NSBundle mainBundle] loadNibNamed:@"CDUserCommentCell" owner:nil options:nil];
    for(id currentObject in topLevelsObjects)
    {
        if([currentObject isKindOfClass:[UITableViewCell class]])
        {
            cell = (CDUserCommentCell *)currentObject;
            break;
        }
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)designCellWithDictionary:(NSDictionary*)dict{
    [self.userNameLabel setText:[dict objectForKey:@"userName"]];
    [self.dateLabel setText:[dict objectForKey:@"date"]];
    [self.commentLabel setText:[dict objectForKey:@"Comment"]];
    [self.commentLabel sizeToFit];
    [self.ratingImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ Star",[dict objectForKey:@"rating"]]]];
}

@end
