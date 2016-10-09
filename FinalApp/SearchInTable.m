//
//  SearchInTable.m
//  
//
//  Created by Imre Gergely László on 2016. 10. 08..
//
//

#import "SearchInTable.h"

@implementation SearchInTable

@synthesize GymArray, fistTableView, json,searchBar, isFiltered, filteredString, GymNameArray, totalArray, secondTableView, addedGyms;

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
    
}

- (void) retriveData
{
    
    
    NSURL * url = [ NSURL URLWithString: @"http://users.atw.hu/pelda-service/app/getAllPerson/gym.php"];
    
    NSData *data = [NSData dataWithContentsOfURL: url];
    
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    GymArray = [[NSMutableArray alloc]init];
    GymNameArray = [[NSMutableArray alloc]init];
    addedGyms = [[NSMutableArray alloc] init];
    
    for (NSMutableDictionary *d in [json objectForKey:@"response"]) {
        
        Gym *actGym = [[Gym alloc] initWithGymID:[d objectForKey:@"id"] andname:[d objectForKey:@"name"] andstreet:[d objectForKey:@"street"]];
        
        [GymArray addObject:actGym];
        NSString *name = actGym.name;
        NSLog(@"neve: %@", name);
       
        
        [GymNameArray addObject: name ];
        
        totalArray = [NSArray arrayWithArray:GymNameArray];
       
    }
    
}











@end