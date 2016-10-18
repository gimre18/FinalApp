//
//  SearchInTable.m
//  
//
//  Created by Imre Gergely László on 2016. 10. 08..
//
//

#import "SearchInTable.h"
#import "GlobalVars.h"

@implementation SearchInTable

@synthesize GymArray, fistTableView, json,json1,searchBar, isFiltered, filteredString, GymNameArray, totalArray, secondTableView, addedGyms;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    fistTableView.delegate = self;
    fistTableView.dataSource = self;
    secondTableView.dataSource = self ;
    secondTableView.delegate = self;
    searchBar.delegate = self;
    
    [self retriveData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [fistTableView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.fistTableView) {
        if (isFiltered) {
           return [filteredString count];
          
            
        }
        return [GymNameArray count];
       

    }
        return [addedGyms count];
    
    
    
    }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (tableView == self.fistTableView) {
        if (!isFiltered) {
            cell.textLabel.text =[GymNameArray objectAtIndex:indexPath.row];
        }
        else cell.textLabel.text =[filteredString objectAtIndex:indexPath.row];
        
        //----
        
        
    }   else {
         cell.textLabel.text =[addedGyms objectAtIndex:indexPath.row];
    }
    
    return cell;
    
}



-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length == 0) {
        isFiltered = NO;
    } else
    {
        isFiltered = YES;
        filteredString = [[NSMutableArray alloc]init];
        for (NSString *str in GymNameArray) {
            NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch ];
            if (stringRange.location != NSNotFound) {
                [filteredString addObject:str];
            }
        }
    }
    [fistTableView reloadData];
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Gym *name = [GymArray objectAtIndex:indexPath.row];

    [addedGyms addObject:name.name];
    
    [secondTableView reloadData];
    
    
    
    
   NSLog(@"%@", [GlobalVars getUser_ID]);
    
   NSDictionary *inputData = [NSDictionary dictionaryWithObjectsAndKeys:
                              [GlobalVars getUser_ID], @"UserId",
                                name.ID, @"GymId",
                              nil];
    
    
    
    
    NSError *error = nil;
    NSData *jsonInputData = [NSJSONSerialization dataWithJSONObject:inputData options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonInputString = [[NSString alloc] initWithData:jsonInputData encoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:@"http://users.atw.hu/pelda-service/app/UsersInGym/postInUserInGym.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[jsonInputString dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    
    
    NSLog(@"megvoltaposzt");

    
}

- (void) retriveData
{
    
    
    NSURL * url = [ NSURL URLWithString: @"http://users.atw.hu/pelda-service/app/getAllPerson/gym.php"];
    
    NSData *data = [NSData dataWithContentsOfURL: url];
    
    json1 = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    GymArray = [[NSMutableArray alloc]init];
    GymNameArray = [[NSMutableArray alloc]init];
    addedGyms = [[NSMutableArray alloc] init];
    
    for (NSMutableDictionary *d in [json1 objectForKey:@"response"]) {
        
        Gym *actGym = [[Gym alloc] initWithGymID:[d objectForKey:@"id"] andname:[d objectForKey:@"name"] andstreet:[d objectForKey:@"street"]];
        
        [GymArray addObject:actGym];
        NSString *name = actGym.name;
        NSLog(@"neve: %@", name);
       
        
        [GymNameArray addObject: name ];
        
       
       
    }
   
    [self deleteExistedGym];
}


-(void) deleteExistedGym {

    NSURL * url = [ NSURL URLWithString: @"http://users.atw.hu/pelda-service/app/UsersInGym/getUsersInGym.php"];
    
    NSData *data = [NSData dataWithContentsOfURL: url];
    
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    
    
    for (NSMutableDictionary *d in [json objectForKey:@"response"]) {
        
        Gym *actGym = [[Gym alloc] initWithgetGymID:[d objectForKey:@"id"]  anduserID:[d objectForKey:@"UserId"]  andGymID:[d objectForKey:@"GymId"]];
        
                       NSLog(@"%@ %@", actGym.userID, actGym.gymID);
        
        NSLog(@"userid:%@   aktuális id: %@",[GlobalVars getUser_ID], actGym.userID);
        if ([[GlobalVars getUser_ID] isEqualToString:actGym.userID]) {
            NSLog(@"egyezett akt userid: %@",actGym.gymID);
            for (int i = 0; i < [GymArray count]; i++) {
                Gym *item = [GymArray objectAtIndex:i];
                NSLog(@"");
                if ([item.ID isEqualToString:actGym.gymID])  {
                    NSLog(@"mit illeszt be: %@", item.ID);
                    [addedGyms addObject: item.name];
                    [GymArray removeObject:item];
                }
                
                
        }
       
}

}
    [fistTableView reloadData];
    [secondTableView reloadData];
    
}





@end