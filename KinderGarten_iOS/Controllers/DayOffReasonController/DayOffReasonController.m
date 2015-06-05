//
//  DayOffReasonController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "DayOffReasonController.h"
#import "DayOffController.h"

static NSString *DayOffReasonControllerCellIdentifier=@"DayOffReasonControllerCell";

@interface DayOffReasonController ()

@end

@implementation DayOffReasonController

-(instancetype)initWithPreController:(DayOffController *)controller{
    if(self=[super initWithStyle:UITableViewStylePlain]){
        self.preController=controller;
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.preController.viewController.dayOffTypeStr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DayOffReasonControllerCellIdentifier];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DayOffReasonControllerCellIdentifier];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [cell.textLabel setText:[self.preController.viewController.dayOffTypeStr objectAtIndex:indexPath.row]];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.preController.dayOffType=indexPath.row;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
