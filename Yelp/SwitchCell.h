//
//  SwitchCell.h
//  Yelp
//
//  Created by Guanqun Mao on 9/19/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwitchCell;
@protocol  SwithCellDelegate  <NSObject>

-(void) switchCell:(SwitchCell*) cell didUpdateValue:(BOOL)value;

@end

@interface SwitchCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) id<SwithCellDelegate> delegate;
@property (nonatomic, assign) BOOL on;

- (void)setOn:(BOOL)on animated:(BOOL)animated;

@end
