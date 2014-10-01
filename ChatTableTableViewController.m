//
//  ChatTableTableViewController.m
//  NewCandy2
//
//  Created by Luke Solomon on 9/22/14.
//  Copyright (c) 2014 Luke Solomon. All rights reserved.
//

#import "ChatTableTableViewController.h"

@interface ChatTableTableViewController ()

@property (nonatomic, strong) NSMutableArray *chatArray;
@property (nonatomic, strong) NSObject *singleCell;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)sendButton:(id)sender;



@end

@implementation ChatTableTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.chatArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Candy" forIndexPath:indexPath];
    
    cell.textLabel.text = @"Text message";
    
    return cell;
}




    



- (IBAction)sendButton:(id)sender {
    
    NSString *chatText = _textField.text;
    
    _textField.text = nil;
    
    [self.chatArray addObject: chatText];
    
}

@end
