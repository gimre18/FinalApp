//
//  GlobalVars.m
//  
//
//  Created by Imre Gergely László on 2016. 10. 09..
//
//

#import "GlobalVars.h"



static NSString* _userName = nil;
static NSString* _userID = nil;


// implementation of getter and setter

@implementation GlobalVars



+ (void) setUser_Name: (NSString *) value1 {
    
    _userName = value1;

}

+ (NSString *) getUser_name {
    
    return _userName;
}

+ (void) setUser_ID:(NSString *) value2{
    
    _userID = value2;
    
}

+ (NSString *) getUser_ID {
    
    return _userID;
}

@end

