//
//  EditCandyViewController.m
//  NewCandy2
//
//  Created by Luke Solomon on 9/22/14.
//  Copyright (c) 2014 Luke Solomon. All rights reserved.
//

#import "EditCandyViewController.h"
#import "AppDelegate.h"

@interface EditCandyViewController ()
@property (weak, nonatomic) IBOutlet UITextField *editLatitudeField;
@property (weak, nonatomic) IBOutlet UITextField *editLongitudeField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *candyName;

@end

@implementation EditCandyViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.candyName.text = self.candy.name;
    self.editLatitudeField.text = [NSString stringWithFormat:@"%@", self.candy.latitude];
    self.editLongitudeField.text = [NSString stringWithFormat:@"%@", self.candy.longitude];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.candy.name = self.candyName.text;
    self.candy.longitude = @([[self.editLongitudeField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] doubleValue]);
    self.candy.latitude = @([[self.editLatitudeField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] doubleValue]);
    
    [(AppDelegate *)[UIApplication sharedApplication].delegate saveContext];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
