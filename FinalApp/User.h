//
//  User.h
//  
//
//  Created by Imre Gergely László on 2016. 10. 09..
//
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userPassword;
-(id) initWithGetUserID: (NSString *) uID andUserName: (NSString *) Username ;
-(id)initWithGetUserID:(NSString *)uID andUserName:(NSString *)uName andUserPassword: (NSString *) uPassword;
@end
