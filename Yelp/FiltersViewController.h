//
//  FiltersViewController.h
//  Yelp
//
//  Created by Guanqun Mao on 9/19/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FiltersViewController;
@protocol FiltersViewControllerDelegate <NSObject>

-(void)filtersViewController:(FiltersViewController *) filtersViewController didChangeFilters:(NSDictionary*)filters;

@end

@interface FiltersViewController : UIViewController

@property (nonatomic, weak) id<FiltersViewControllerDelegate> delegate;
@end
