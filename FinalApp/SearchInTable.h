//
//  SearchInTable.h
//  
//
//  Created by Imre Gergely László on 2016. 10. 08..
//
//

#import <UIKit/UIKit.h>
#import "Gym.h"


@interface SearchInTable : UIViewController <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>;

@property (weak, nonatomic) IBOutlet UITableView *fistTableView;
@property (weak, nonatomic) IBOutlet UITableView *secondTableView;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@property NSURLConnection *postConnection;

@property (nonatomic, strong) NSMutableArray* filteredString;


@property  BOOL *isFiltered;

@property (nonatomic, strong) NSMutableArray *addedGyms;
@property (nonatomic, strong) NSMutableArray *GymNameArray;

@property (nonatomic, strong) NSMutableArray *GymArray;

@property (nonatomic, strong) NSArray *totalArray;

@property (nonatomic, strong) NSMutableDictionary *json;
@property (nonatomic, strong) NSMutableDictionary *json1;

@end
