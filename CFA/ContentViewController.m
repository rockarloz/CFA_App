//
//  ContentViewController.m
//  CFA
//
//  Created by Carlos Castellanos on 31/01/15.
//  Copyright (c) 2015 Carlos Castellanos. All rights reserved.
//

#import "ContentViewController.h"
#import <AFHTTPRequestOperationManager.h>
#import "OrganizationTableViewCell.h"
#import "OrganizationDescriptionViewController.h"
@interface ContentViewController ()

@end

@implementation ContentViewController
{

    NSMutableArray *content;
    NSString *nextPage;
}
- (void)viewDidLoad {
    content=[[NSMutableArray alloc]init];
    
    _contentTable = [self makeTableView];
    [_contentTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Content"];
    [self.view addSubview:_contentTable];
    [self getData:@"http://codeforamerica.org/api/organizations"];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getData:(NSString *)url {
    
  
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:@{} success:^(AFHTTPRequestOperation *operation, id responseObject){
        nextPage=responseObject[@"pages"][@"next"];
        for (NSDictionary *item in responseObject[@"objects"]) {
            [content addObject:item];
            NSLog(@"%@",item[@"name"]);
        }
        if ([content count]) {
            NSLog(@"si hay ");
            [_contentTable reloadData];
        }
        else{
            // No Success
            NSLog(@"no hay ");
        }
        
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error %@", error);
        
        
    }];
    
}
-(UITableView *)makeTableView
{
    CGFloat x = 0;
    CGFloat y = 50;
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height - 50;
   
    CGRect tableFrame = CGRectMake(x, y, width, height);
    
    _contentTable= [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStylePlain];
    
    _contentTable.rowHeight = 80;
    _contentTable.sectionFooterHeight = 22;
    _contentTable.sectionHeaderHeight = 22;
    _contentTable.scrollEnabled = YES;
    _contentTable.showsVerticalScrollIndicator = YES;
    _contentTable.userInteractionEnabled = YES;
    _contentTable.bounces = YES;
    
    _contentTable.delegate = self;
    _contentTable.dataSource = self;
    
    return _contentTable;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return content.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    OrganizationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[OrganizationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell.name setText: [content objectAtIndex:indexPath.row][@"name"] ];
    [cell.city setText: [content objectAtIndex:indexPath.row][@"city"] ];
    [cell.type setText: [content objectAtIndex:indexPath.row][@"type"] ];
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger lastSectionIndex = [tableView numberOfSections] - 1;
    NSInteger lastRowIndex = [tableView numberOfRowsInSection:lastSectionIndex] - 1;
    if ((indexPath.section == lastSectionIndex) && (indexPath.row == lastRowIndex)) {
        [self getData:nextPage];
    }
}


#pragma mark - Table view Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    OrganizationDescriptionViewController *detail = [[OrganizationDescriptionViewController alloc] init];
    detail.data=[content objectAtIndex:indexPath.row];
    [self presentViewController:detail animated:YES completion:nil];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
