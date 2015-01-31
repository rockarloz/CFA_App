//
//  OrganizationTableViewCell.h
//  CFA
//
//  Created by Carlos Castellanos on 31/01/15.
//  Copyright (c) 2015 Carlos Castellanos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrganizationTableViewCell : UITableViewCell
@property (nonatomic,strong) IBOutlet UILabel *name;
@property (nonatomic,strong) IBOutlet UILabel *city;
@property (nonatomic,strong) IBOutlet UILabel *type;
@end
