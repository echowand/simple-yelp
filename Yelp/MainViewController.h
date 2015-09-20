//
//  MainViewController.h
//  Yelp
//
//  Created by Timothy Lee on 3/21/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YelpClient.h"
#import "Business.h"
#import "BusinessCell.h"

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
