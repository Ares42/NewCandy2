//
//  MapViewController.m
//  NewCandy2
//
//  Created by Luke Solomon on 9/21/14.
//  Copyright (c) 2014 Luke Solomon. All rights reserved.
//

#import "MapViewController.h"

@import MapKit;


@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

    MKCoordinateSpan span = MKCoordinateSpanMake(0.2, 0.2);
    
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake([self.candy.latitude doubleValue], [self.candy.longitude doubleValue]);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(location, span);
    
    [self.mapView setRegion:region animated:YES];
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
