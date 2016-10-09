//
//  PickerGym.h
//  
//
//  Created by Imre Gergely László on 2016. 10. 06..
//
//

#import <UIKit/UIKit.h>
#import "Gym.h"


@interface Pickerview : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSMutableDictionary *json;
@property (nonatomic, strong) NSMutableArray *GymArray;
@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, strong) NSMutableArray *GymNameArray;
@property(nonatomic,strong)NSArray *item;
@property(nonatomic,strong)IBOutlet UILabel *lblColor;

- (IBAction)add:(UIButton *)sender;


- (IBAction)process:(UIButton *)sender;

@end
