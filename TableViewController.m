//
//  TableViewController.m
//  NewCandy2
//
//  Created by Luke Solomon on 9/21/14.
//  Copyright (c) 2014 Luke Solomon. All rights reserved.
//

#import "TableViewController.h"
#import "Candy.h"
#import "AppDelegate.h"
#import "DetailViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) NSMutableArray *candies;

@end

@implementation TableViewController

#pragma mark - init

- (id) initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]){
        NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
        
        _candies = [NSMutableArray array];
        
        for(int i = 0; i < 10; i++){
            
            Candy *newCandy = [NSEntityDescription insertNewObjectForEntityForName:@"Candy" inManagedObjectContext:context];
            
            //create dummy data
            newCandy.name = [NSString stringWithFormat:@"candy%d", i+1];
            
            //NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"placeholder" ofType:@"png"];
            //newCandy.image = UIImagePNGRepresentation([UIImage imageWithContentsOfFile:imagePath]);
            
            newCandy.latitude = @(37);
            newCandy.longitude = @(-122);
            
            [_candies addObject:newCandy];
            
        }
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.candies.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Candy" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [self.candies[indexPath.row] name];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    DetailViewController *destination = (DetailViewController *)[segue destinationViewController];
    
    NSIndexPath *index = self.tableView.indexPathForSelectedRow;
    
    destination.candy = self.candies[index.row];
}


@end
