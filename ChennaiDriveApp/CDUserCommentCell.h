//
//  CDUserCommentCell.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/21/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDUserCommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ratingImage;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
//@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

+ (CDUserCommentCell*)getUserCommentCell;
- (void)designCellWithDictionary:(NSDictionary*)dict;

@end
