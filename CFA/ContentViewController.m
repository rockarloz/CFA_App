//
//  ContentViewController.m
//  CFA
//
//  Created by Carlos Castellanos on 31/01/15.
//  Copyright (c) 2015 Carlos Castellanos. All rights reserved.
//

#import "ContentViewController.h"
#import <AFHTTPRequestOperationManager.h>
@interface ContentViewController ()

@end

@implementation ContentViewController
{

    NSMutableArray *content;
}
- (void)viewDidLoad {
    content=[[NSMutableArray alloc]init];
    
    _contentTable = [self makeTableView];
    [_contentTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Content"];
    [self.view addSubview:_contentTable];
    [self getData];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getData{
    
  
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://codeforamerica.org/api/organizations" parameters:@{} success:^(AFHTTPRequestOperation *operation, id responseObject){
        
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell.textLabel setText: [content objectAtIndex:indexPath.row][@"name"] ];
    
    return cell;
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
