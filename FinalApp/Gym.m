//
//  Gym.m
//  
//
//  Created by Imre Gergely László on 2016. 04. 25..
//
//

#import "Gym.h"

@implementation Gym
@synthesize ID,name,street,userID,gymID;


- (id) initWithGymID: (NSString *) gID andname: (NSString *) gName andstreet: (NSString *) gStreet
{
    
    self = [super init];
    
    if (self) {
        
        
    ID = gID;
    name = gName;
    street = gStreet;
    }
    
    return self;
}


- (id) initWithgetGymID: (NSString *) gID anduserID: (NSString *) guserID andGymID: (NSString *) gGymID
{
    self = [super init];
    
    if (self) {
        
        
        ID = gID;
        userID = guserID;
        gymID = gGymID;
    }
    
    return self;
}




@end
