//
//  Gym.h
//  
//
//  Created by Imre Gergely László on 2016. 04. 25..
//
//

#import <Foundation/Foundation.h>

@interface Gym : NSObject

@property (nonatomic, strong) NSString * ID;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * street;
@property (nonatomic, strong) NSString * userID;
@property (nonatomic, strong) NSString * gymID;


- (id) initWithGymID: (NSString *) gID andname: (NSString *) gName andstreet: (NSString *) uStreet;

- (id) initWithgetGymID: (NSString *) gID anduserID: (NSString *) guserID andGymID: (NSString *) gGymID;



@end
