//
//  RegistrationView.m
//  
//
//  Created by Imre Gergely László on 2016. 10. 05..
//
//

#import "RegistrationView.h"
#import "Pickerview.h"

@implementation RegistrationView

@synthesize UserName, UserPassword,Firstname,Lastname,Address,PhoneNumber,Trainer,Grender,EmailAddress;



- (IBAction)Registration:(UIButton *)sender {

    NSString *swGrender, *swTrainer;

    if ([Grender isOn]) {
        swGrender = @"1";
    }   else swGrender = @"0";
    
    if ([Trainer isOn]) {
        swTrainer = @"1";
    }   else swTrainer = @"0";
    
    NSDictionary *inputData = [NSDictionary dictionaryWithObjectsAndKeys :
                               Firstname.text, @"Firstname",
                               Lastname.text, @"Lastname",
                               UserName.text, @"Username",
                               UserPassword.text, @"Password",
                               EmailAddress.text , @"EmailAddress",
                               PhoneNumber.text, @"PhoneNumber",
                               Address.text,@"Address",
                               swGrender, @"Grender",
                               swTrainer, @"Trainer",
                               nil];
  

    
    
        NSError *error = nil;
        NSData *jsonInputData = [NSJSONSerialization dataWithJSONObject:inputData options:NSJSONWritingPrettyPrinted error:&error];
        NSString *jsonInputString = [[NSString alloc] initWithData:jsonInputData encoding:NSUTF8StringEncoding];
        
        NSURL *url = [NSURL URLWithString:@"http://users.atw.hu/pelda-service/app/newUser/indexf-1.php"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[jsonInputString dataUsingEncoding:NSUTF8StringEncoding]];
        NSURLResponse *response;
        NSError *err;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
        
        
        
        

    
}

- (IBAction)process:(UIButton *)sender {
    
    
}
@end
