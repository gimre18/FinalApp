//
//  RegistrationView.h
//  
//
//  Created by Imre Gergely László on 2016. 10. 05..
//
//

#import <UIKit/UIKit.h>
#import "RegistrationView.h"

@interface RegistrationView : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *UserPassword;

@property (weak, nonatomic) IBOutlet UITextField *Firstname;
@property (weak, nonatomic) IBOutlet UITextField *Lastname;
@property (weak, nonatomic) IBOutlet UITextField *EmailAddress;
@property (weak, nonatomic) IBOutlet UITextField *Address;
@property (weak, nonatomic) IBOutlet UISwitch *Trainer;
@property (weak, nonatomic) IBOutlet UISwitch *Grender;

@property (weak, nonatomic) IBOutlet UITextField *PhoneNumber;
@property NSURLConnection *postConnection;

- (IBAction)Registration:(UIButton *)sender;

- (IBAction)process:(UIButton *)sender;

@end
