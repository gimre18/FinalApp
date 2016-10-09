//
//  PickerGym.m
//  
//
//  Created by Imre Gergely László on 2016. 10. 06..
//
//

#import "Pickerview.h"

@implementation Pickerview



@synthesize json,GymArray, myPickerView, label,GymNameArray,item;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   // self.item = [[NSArray alloc]initWithObjects:@"Green",@"Blue",@"Red",@"Yellow",@"Gray",@"Pink",@"Orange", nil];
    
    
    NSURL * url = [ NSURL URLWithString: @"http://users.atw.hu/pelda-service/app/getAllPerson/gym.php"];
    
    NSData *data = [NSData dataWithContentsOfURL: url];
    
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    GymArray = [[NSMutableArray alloc]init];
     GymNameArray = [[NSMutableArray alloc]init];
    
    for (NSMutableDictionary *d in [json objectForKey:@"response"]) {
        
        Gym *actGym = [[Gym alloc] initWithGymID:[d objectForKey:@"id"] andname:[d objectForKey:@"name"] andstreet:[d objectForKey:@"street"]];
        
        [GymArray addObject:actGym];
        NSString *name = actGym.name;
        NSLog(@"neve: %@", name);
        
        [GymNameArray addObject: name ];
    }
    
    
    
    for (Gym  *t in GymArray ) {
        
        NSLog(@"%@, %@,", t.name  , t.street);
        
    }
    NSLog(@"asdasd");
    
  item = [NSArray arrayWithArray:GymNameArray];
     //self.item = [[NSArray alloc]initWithObjects:@"Green",@"Blue",@"Red",@"Yellow",@"Gray",@"Pink",@"Orange", nil];
    
    
}

//All delegates method of pickerView
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.item count];
    
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.item objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"Selected : %@",[self.item objectAtIndex:row]);
}
- (IBAction)process:(UIButton *)sender {
{
    NSString *selectedColor = [self.item objectAtIndex:[self.myPickerView selectedRowInComponent:0]];
    self.label.text = [NSString stringWithFormat:@"Selected Color is : %@",selectedColor];
    int selectedRow = [self.myPickerView  selectedRowInComponent:0];
    
    switch (selectedRow) {
            //Case green color
        case 0:
            
            self.lblColor.textColor = [UIColor colorWithRed:0.0f/255.0f green:255.0f/255.0f blue:0.0f/255.0f alpha:255.0f/255.0f];
            break;
            
            //Case blue color
        case 1:
            
            self.lblColor.textColor = [UIColor colorWithRed:0.0f/255.0f green:255.0f/255.0f blue:0.0f/255.0f alpha:255.0f/255.0f];
            break;
            
            //Case Red color
            
        case 2:
            self.lblColor.textColor = [UIColor colorWithRed:255.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:255.0f/255.0f];
            break;
            
            //case yellow color
        case 3:
            self.lblColor.textColor = [UIColor colorWithRed:250.0f/255.0f green:247.0f/255.0f blue:11.0f/255.0f alpha:255.0f/255.0f];
            break;
            
            //case gray color
            
        case 4:
            self.lblColor.textColor = [UIColor colorWithRed:140.0f/255.0f green:140.0f/255.0f blue:140.0f/255.0f alpha:255.0f/255.0f];
            break;
            
            //case pick color
            
        case 5:
            self.lblColor.textColor = [UIColor colorWithRed:222.0f/255.0f green:46.0f/255.0f blue:220.0f/255.0f alpha:255.0f/255.0f];
            break;
            
            //case orange color
            
        case 6:
            self.lblColor.textColor = [UIColor colorWithRed:246.0f/255.0f green:96.0f/255.0f blue:6.0f/255.0f alpha:255.0f/255.0f];
            break;
            
    }




   
    
    /*
    
    NSURL * url = [ NSURL URLWithString: @"http://users.atw.hu/pelda-service/app/getAllPerson/gym.php"];
    
    NSData *data = [NSData dataWithContentsOfURL: url];
    
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    GymArray = [[NSMutableArray alloc]init];
        
    for (NSMutableDictionary *d in [json objectForKey:@"response"]) {
        
        Gym *actGym = [[Gym alloc] initWithGymID:[d objectForKey:@"id"] andname:[d objectForKey:@"name"] andstreet:[d objectForKey:@"street"]];
        
        [GymArray addObject:actGym];
        [GymNameArray addObject:actGym.name ];
    }
    
    
    for (Gym  *t in GymArray ) {
        
        NSLog(@"%@, %@,", t.name  , t.street);
        
    }
    

}


*/
}}
@end


