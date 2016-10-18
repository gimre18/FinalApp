//
//  ViewController.h
//  gym
//
//  Created by Imre Gergely László on 2016. 04. 25..
//  Copyright (c) 2016. Imre Gergely László. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Gym.h"

@interface MapView : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *map;


@property (nonatomic, strong) NSMutableDictionary *json;
@property (nonatomic, strong) NSMutableArray *UserArray;

- (void) start;

@end

