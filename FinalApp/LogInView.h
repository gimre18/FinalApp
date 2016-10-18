//
//  LogInView.h
//  
//
//  Created by Imre Gergely László on 2016. 10. 12..
//
//

#import <UIKit/UIKit.h>
#import "User.h"


@interface LogInView : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *logUsername;
@property (weak, nonatomic) IBOutlet UITextField *logPassword;
@property (nonatomic, strong) NSMutableDictionary *json;
@property (nonatomic, strong) NSMutableArray *userArray;
- (IBAction)LoginButton:(id)sender;



@end
