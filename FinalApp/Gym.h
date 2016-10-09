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

- (id) initWithGymID: (NSString *) gID andname: (NSString *) gName andstreet: (NSString *) uStreet;





@end
