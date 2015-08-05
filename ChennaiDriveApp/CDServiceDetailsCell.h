//
//  CDServiceDetailsCell.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/20/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDServiceDetailsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *fullCellLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
+ (CDServiceDetailsCell*)getServiceDetailsCell;

@end
