//
//  BusinessCell.m
//  Yelp
//
//  Created by Guanqun Mao on 9/19/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "BusinessCell.h"
#import "UIImageView+AFNetworking.h"

@implementation BusinessCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setBusiness:(Business *)business{
    _business = business;
    [self.thumbImageView setImageWithURL:[NSURL URLWithString:self.business.imageUrl]];
    self.nameLabel.text = self.business.name;
    [self.ratingImageView setImageWithURL:[NSURL URLWithString:self.business.ratingImageUrl]];
    self.ratingLabel.text = [NSString stringWithFormat:@"%ld Reviews", self.business.numReviews];
    float milesPerMeter = 0.000621371;
    self.distanceLabel.text = [NSString stringWithFormat:@"%.2f m", self.business.distance*milesPerMeter];
    self.addressLabel.text = self.business.address;
    self.categoryLabel.text = self.business.categories;
    NSLog(@"------%@", self.business.categories);
}

@end
