//
//  OrganizationDescriptionViewController.m
//  CFA
//
//  Created by Carlos Castellanos on 31/01/15.
//  Copyright (c) 2015 Carlos Castellanos. All rights reserved.
//

#import "OrganizationDescriptionViewController.h"

@interface OrganizationDescriptionViewController ()

@end

@implementation OrganizationDescriptionViewController
{
 
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _map=[[MKMapView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 250)];
    _map.delegate=self;
    [self.view addSubview:_map];
    
    //add marker
    CLLocationCoordinate2D marker;
    marker.latitude = [_data[@"latitude"] doubleValue];
    marker.longitude = [_data[@"longitude"] doubleValue];
   
  
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(marker, 1000, 1000);
    [_map setRegion:region animated:YES];
    // Do any additional setup after loading the view.
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

@end
