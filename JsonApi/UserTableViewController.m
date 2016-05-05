//
//  UserTableViewController.m
//  JsonApi
//
//  Created by Elena Maso Willen on 04/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "UserTableViewController.h"
#import "UserTableViewCell.h"
#import "User.h"

@interface UserTableViewController () <NSURLSessionDelegate>

@property (strong, nonatomic) NSMutableArray *usersArray;

@end

@implementation UserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.usersArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    [self loadUser];
    
    
    
    

}


- (void)loadUser {
    
    NSString *apiUrl = @"http://jsonplaceholder.typicode.com/users";
    
    NSURLSession *session = [NSURLSession sharedSession];

//    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    
    NSURLSessionDataTask *jsonData = [session dataTaskWithURL:[NSURL URLWithString:apiUrl] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
        NSError *jsonError;
        NSArray *usersList = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        
        for (NSDictionary *dict in usersList) {
            User *newUser = [[User alloc]init];
            newUser.name = dict[@"name"];
            
            [newUser firstName:newUser.name];
            NSLog(@"my first name is %@", newUser.firstName);
            
            [newUser lastName:newUser.name];
            NSLog(@"my last name is %@", newUser.lastName);

            
            newUser.email = dict[@"email"];
            newUser.phone = dict[@"phone"];
            
            [self.usersArray addObject:newUser];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            
            [self.tableView reloadData];
        });
        
        
    }];

    [jsonData resume];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.usersArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserTableViewCell *cell = (UserTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];
    
    User *userForCell = self.usersArray[indexPath.row];
    
        
        cell.nameLabel.text = userForCell.name;
        cell.emailLabel.text = userForCell.email;
        cell.phoneLabel.text = userForCell.phone;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
