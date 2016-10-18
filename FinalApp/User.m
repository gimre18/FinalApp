//
//  User.m
//  
//
//  Created by Imre Gergely László on 2016. 10. 09..
//
//

#import "User.h"

@implementation User
@synthesize userID,userName,userPassword;

-(id)initWithGetUserID:(NSString *)uID andUserName:(NSString *)uName andUserPassword: (NSString *) uPassword{
    self = [super init];
    
    if (self) {
        userID = uID;
        userName = uName;
        userPassword = uPassword;
    }
    return self;
}

-(id) initWithGetUserID: (NSString *) uID andUserName: (NSString *) Username {
    self = [super init];
    
    if (self) {
        userID = uID;
        userName = Username;
     
    }
    return self;
}


@end
