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
#import "ChatTableTableViewController.h"
#import "EditCandyViewController.h"

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
            
            newCandy.latitude = @(37.773144);
            newCandy.longitude = @(-122.406319);
            
            [_candies addObject:newCandy];
        }
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSManagedObjectContext *managedObjectContext = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    
    if ([segue.identifier isEqualToString:@"ShowDetail"]){
        DetailViewController *destination = [segue destinationViewController];
        NSIndexPath *index = self.tableView.indexPathForSelectedRow;
        destination.candy = self.candies[index.row];
    }
    
    else if([segue.identifier isEqualToString:@"AddCandy"]){
        DetailViewController *destination = [segue destinationViewController];
        Candy *newCandy = [NSEntityDescription insertNewObjectForEntityForName:@"Candy" inManagedObjectContext:managedObjectContext];
        destination.candy = newCandy;
        [self.candies addObject:newCandy];
    }
    
//    else if ([segue.identifier isEqualToString:@"ShowChat"]){
//        ChatTableTableViewController *destination = [segue destinationViewController];
//        
//    }
    
    
    
}


@end
