//
//  ImageViewController.m
//  NewCandy2
//
//  Created by Luke Solomon on 9/22/14.
//  Copyright (c) 2014 Luke Solomon. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) viewWillAppear:(BOOL)animated  {
    
    [super viewWillAppear:animated];
    //set the imageView equal to the candy's image
    self.imageView.image = [UIImage imageWithData:self.candy.image];
    _imageView.userInteractionEnabled = TRUE;
    
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
