//
//  ViewController.m
//  CFA
//
//  Created by Carlos Castellanos on 30/01/15.
//  Copyright (c) 2015 Carlos Castellanos. All rights reserved.
//

#import "ViewController.h"
#import "ContentViewController.h"
@interface ViewController ()

@end

@implementation ViewController
{

    NSArray *options;
}
- (void)viewDidLoad {
    options=[[NSArray alloc]initWithObjects:@"Organizations",@"Projects",@"Events", @"Stories",@"Issues",nil];
    [super viewDidLoad];
    _optionsTable = [self makeTableView];
    [_optionsTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"newFriendCell"];
    [self.view addSubview:_optionsTable];
    // Do any additional setup after loading the view, typically from a nib.
}

-(UITableView *)makeTableView
{
    CGFloat x = 0;
    CGFloat y = 50;
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height - 50;
     height = options.count*80 - 0;
    CGRect tableFrame = CGRectMake(x, y, width, height);
    
   _optionsTable= [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStylePlain];
    
    _optionsTable.rowHeight = 80;
    _optionsTable.sectionFooterHeight = 22;
    _optionsTable.sectionHeaderHeight = 22;
    _optionsTable.scrollEnabled = YES;
    _optionsTable.showsVerticalScrollIndicator = YES;
    _optionsTable.userInteractionEnabled = YES;
    _optionsTable.bounces = YES;
    
    _optionsTable.delegate = self;
    _optionsTable.dataSource = self;
    
    return _optionsTable;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return options.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell.textLabel setText: [options objectAtIndex:indexPath.row]];
    
    return cell;
}
#pragma mark - Table view Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
ContentViewController *content = [[ContentViewController alloc] init];
[self presentViewController:content animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
