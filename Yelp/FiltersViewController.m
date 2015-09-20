//
//  FiltersViewController.m
//  Yelp
//
//  Created by Guanqun Mao on 9/19/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "FiltersViewController.h"
#import "SwitchCell.h"

@interface FiltersViewController () <UITableViewDataSource, UITableViewDelegate, SwithCellDelegate>
@property (nonatomic, readonly) NSDictionary* filters;
@property (weak, nonatomic) IBOutlet UITableView *filtersTableView;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) NSMutableSet *selectedCategories;
- (void) initCategories;

@end

@implementation FiltersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.selectedCategories = [NSMutableSet set];
        [self initCategories];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelButton)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(onSaveButton)];
    self.filtersTableView.delegate = self;
    self.filtersTableView.dataSource = self;
    [self.filtersTableView registerNib:[UINib nibWithNibName:@"SwitchCell" bundle:nil] forCellReuseIdentifier:@"SwitchCell" ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)onCancelButton{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onSaveButton{
    [self.delegate filtersViewController:self didChangeFilters:self.filters];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categories.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SwitchCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchCell"];
    cell.titleLabel.text = self.categories[indexPath.row][@"name"];
    cell.on = [self.selectedCategories containsObject:self.categories[indexPath.row]];
    cell.delegate = self;
    return cell;
}

- (void)switchCell:(SwitchCell *)cell didUpdateValue:(BOOL)value{
    NSIndexPath *indexPath = [self.filtersTableView indexPathForCell:cell];
    if(value){
        [self.selectedCategories addObject:self.categories[indexPath.row]];
    }else{
        [self.selectedCategories removeObject:self.categories[indexPath.row]];
    }
}

-(void)initCategories{
    self.categories =
    @[@{@"name":@"Thai", @"code":@"thai"},
    @{@"name":@"Bars", @"code":@"bars"}];
}

@end
