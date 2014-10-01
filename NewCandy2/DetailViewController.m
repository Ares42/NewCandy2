//
//  DetailViewController.m
//  NewCandy2
//
//  Created by Luke Solomon on 9/21/14.
//  Copyright (c) 2014 Luke Solomon. All rights reserved.
//

#import "DetailViewController.h"
#import "ImageViewController.h"
#import "MapViewController.h"
#import "EditCandyViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *candyTitle;
@property (weak, nonatomic) IBOutlet UIImageView *candyImage;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    //set the view's title equal to the candy's title
    self.candyTitle.text = self.candy.name;
    
    //set the imageView equal to the candy's image
    [self.candyImage setImage:([UIImage imageWithData:self.candy.image])];
    
    _candyImage.userInteractionEnabled = TRUE;
    
}

//- (void) viewWillDisappear:(BOOL)animated {
//    
//    
//    
//}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

//    DetailViewController *destination = (DetailViewController *)[segue destinationViewController];
    
    if ([segue.identifier isEqualToString:@"ViewImage"]){
        ImageViewController *destination = [segue destinationViewController];
        destination.candy = self.candy;
        
    }
    
    else if ([segue.identifier isEqualToString:@"ViewMap"]){
        MapViewController *mapViewController = [segue destinationViewController];
        mapViewController.candy = self.candy;
    }
    
    else if ([segue.identifier isEqualToString:@"EditCandy"]){
        EditCandyViewController *editCandyViewController = [segue destinationViewController];
        editCandyViewController.candy = self.candy;
    }
    
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
