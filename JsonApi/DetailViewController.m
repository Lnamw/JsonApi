//
//  DetailViewController.m
//  JsonApi
//
//  Created by Elena Maso Willen on 05/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "DetailViewController.h"
#import "User.h"
#import "Adress.h"
#import "Geo.h"
#import "Company.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface DetailViewController () <MKMapViewDelegate>

@property (strong, nonatomic) CLLocationManager *locMgr;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.fullNameLabel.text = self.userSelected.fullName;
    self.streetLabel.text = self.userSelected.fullAdress.street;
    self.suiteLabel.text = self.userSelected.fullAdress.suite;
    self.cityLabel.text = self.userSelected.fullAdress.city;
    self.zipcodeLabel.text = self.userSelected.fullAdress.zipcode;
    
    self.companyNameLabel.text = self.userSelected.companyInfo.name;
    self.companyCatchPhraseLabel.text = self.userSelected.companyInfo.catchPhrase;
    self.companyBsLabel.text = self.userSelected.companyInfo.bs;
    
    

    [self.mapView setDelegate:self];
    
    double latitude = [self.userSelected.fullAdress.fullGeo.latitude doubleValue];
    double longitude = [self.userSelected.fullAdress.fullGeo.longitude doubleValue];
    
    CLLocationCoordinate2D userlocation = CLLocationCoordinate2DMake(latitude, longitude);
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userlocation, 10000000, 10000000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
    point.coordinate = userlocation;
    point.title = @"%@ User adress", self.userSelected.name;
    point.subtitle = @"yeah!";
    [self.mapView addAnnotation:point];

    

}

- (void)viewDidAppear:(BOOL)animated {
    
    self.locMgr = [[CLLocationManager alloc]init];
    [self.locMgr requestWhenInUseAuthorization];
    self.mapView.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MapKit delegate methods 

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {

    
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
