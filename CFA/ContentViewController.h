//
//  ContentViewController.h
//  CFA
//
//  Created by Carlos Castellanos on 31/01/15.
//  Copyright (c) 2015 Carlos Castellanos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong)IBOutlet UITableView *contentTable;
@end
