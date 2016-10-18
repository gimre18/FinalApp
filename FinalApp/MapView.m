//
//  ViewController.m
//  gym
//
//  Created by Imre Gergely László on 2016. 04. 25..
//  Copyright (c) 2016. Imre Gergely László. All rights reserved.
//

#import "MapView.h"


@interface MapView ()

@end

@implementation MapView

@synthesize json,map,UserArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     //-----------------------------
    NSURL * url = [ NSURL URLWithString: @"http://users.atw.hu/pelda-service/app/getAllPerson/gym.php"];
    
    NSData *data = [NSData dataWithContentsOfURL: url];
    
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    UserArray  = [[NSMutableArray alloc]init];
    
    for (NSMutableDictionary *d in [json objectForKey:@"response"]) {
                 NSLog(@"%@, %@, %@", [d objectForKey:@"id"],[d objectForKey:@"name"],[d objectForKey:@"street"]);
        
        // User *myUser = [[User alloc] initWithUserID:[d objectForKey:@"id"] andUserName:[d objectForKey:@"name"] anduserPhoneNumb:@"" anduserAdress:[d objectForKey:@"password"] anduserGrender:@""];
        
        Gym *aktGym = [[Gym alloc] initWithGymID:[d objectForKey:@"id"] andname:[d objectForKey:@"name"] andstreet:[d objectForKey:@"street"]];
        [UserArray addObject:aktGym];
    }

    //-----------------------------
    
    
    for (Gym *g in UserArray) {
        
        
        NSString *addressString = g.street;
        
        CLGeocoder *geocoder = [[CLGeocoder alloc]init];
        [geocoder geocodeAddressString:addressString
                     completionHandler:^(NSArray* placemarks, NSError* error)
         {
             if ([placemarks count]>0)
             {
                 CLPlacemark *clPlace = [placemarks objectAtIndex:0];
                 CLLocation   *location = clPlace.location;
                 MKPointAnnotation *Pin = [[MKPointAnnotation alloc]init];
                 Pin.coordinate = location.coordinate;
                 Pin.title = g.name;
                 
                 // add annotation to mapview
                 [map addAnnotation:Pin];
                 
                 MKCoordinateRegion region;
                 MKCoordinateSpan span;
                 span.latitudeDelta = 0.1;
                 span.longitudeDelta = 0.1;
                 CLLocationCoordinate2D locationn;
                 locationn.latitude = location.coordinate.latitude;
                 locationn.longitude = location.coordinate.longitude;
                 region.span = span;
                 region.center = locationn;
                 [map setRegion:region animated:YES];
                 
                 
             };
         }];

    }
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
