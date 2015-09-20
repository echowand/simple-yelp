//
//  Business.m
//  Yelp
//
//  Created by Guanqun Mao on 9/18/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "Business.h"

@implementation Business

- (id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        NSArray *categories = dictionary[@"categories"];
        NSMutableArray *categoryNames = [NSMutableArray array];
        [categories enumerateObjectsUsingBlock:^(id obj, NSUInteger i, BOOL *stop){
            [categoryNames addObject:obj[0]];
        }];
        self.categories = [categoryNames componentsJoinedByString:@", "];
        self.name = dictionary[@"name"];
        self.imageUrl = dictionary[@"image_url"];
        NSDictionary *location = dictionary[@"location"];
        self.address = [NSString stringWithFormat:@"%@, %@", location[@"address"][0], location[@"neighborhoods"][0]];
        //NSLog(@"----------%@", self.address);
        self.numReviews = [dictionary[@"review_count"] integerValue];
        self.ratingImageUrl = dictionary[@"rating_img_url"];
        self.distance = [dictionary[@"distance"] integerValue];
    }
    return self;
}

+ (NSArray *) businessesWithDictionaries:(NSArray *)dictionaries {
    NSMutableArray *businesses = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        Business *business = [[Business alloc] initWithDictionary:dictionary];
        [businesses addObject:business];
    }
    return businesses;
}

@end
