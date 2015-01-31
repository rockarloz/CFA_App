//
//  ViewController.h
//  CFA
//
//  Created by Carlos Castellanos on 30/01/15.
//  Copyright (c) 2015 Carlos Castellanos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong)IBOutlet UITableView *optionsTable;

@end

