//
//  LogInView.m
//  
//
//  Created by Imre Gergely László on 2016. 10. 12..
//
//

#import "LogInView.h"
#import "User.h"

@implementation LogInView
@synthesize json,userArray,logUsername,logPassword;

- (IBAction)LoginButton:(id)sender {
    
    for (User *u in userArray) {
        if ([self.logUsername.text isEqualToString:u.userName] && [self.logPassword.text isEqualToString:u.userPassword] ) {
            NSLog(@"sikeres");
        }
    }
    
}


- (void) viewDidLoad {

    
    NSURL * url = [ NSURL URLWithString: @"http://users.atw.hu/pelda-service/app/getAllPerson/getUserLogin.php"];
    
    NSData *data = [NSData dataWithContentsOfURL: url];
    
    userArray = [[NSMutableArray alloc]init];
    
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
   
    for (NSMutableDictionary *d in [json objectForKey:@"response"]) {
        
      
        User *actUser = [[User alloc] initWithGetUserID:[d objectForKey:@"User_id"] andUserName:[d objectForKey:@"Username"] andUserPassword:[d objectForKey:@"Password"]];
        
        [userArray addObject:actUser];
       
        for (User *u in userArray) {
            NSLog(@"%@", u.userName);
        }
    }

    
}
@end
