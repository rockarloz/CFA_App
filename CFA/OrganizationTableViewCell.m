//
//  OrganizationTableViewCell.m
//  CFA
//
//  Created by Carlos Castellanos on 31/01/15.
//  Copyright (c) 2015 Carlos Castellanos. All rights reserved.
//

#import "OrganizationTableViewCell.h"

@implementation OrganizationTableViewCell


- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor grayColor];
        _name=[[UILabel alloc]initWithFrame:CGRectMake(5, 15, 300, 34)];
        _name.textColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _name.textAlignment=NSTextAlignmentLeft;
        [_name setFont:[UIFont systemFontOfSize:18]];
      
        [self   addSubview:_name];
        
        self.backgroundColor=[UIColor grayColor];
        _city=[[UILabel alloc]initWithFrame:CGRectMake(5, 50, 150, 34)];
        _city.textColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _city.textAlignment=NSTextAlignmentLeft;
        [_city setFont:[UIFont systemFontOfSize:12]];
        
        [self   addSubview:_city];
        
        self.backgroundColor=[UIColor grayColor];
        _type=[[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-150, 50, 150, 34)];
        _type.textColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _type.textAlignment=NSTextAlignmentRight;
        [_type setFont:[UIFont systemFontOfSize:12]];
        
        [self   addSubview:_type];
       
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
