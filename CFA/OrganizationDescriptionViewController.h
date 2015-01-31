//
//  OrganizationDescriptionViewController.h
//  CFA
//
//  Created by Carlos Castellanos on 31/01/15.
//  Copyright (c) 2015 Carlos Castellanos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface OrganizationDescriptionViewController : UIViewController <MKMapViewDelegate>
@property (nonatomic ,strong)NSMutableDictionary *data;
@property (nonatomic,strong)IBOutlet MKMapView *map;
@end
