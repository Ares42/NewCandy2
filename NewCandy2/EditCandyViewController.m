//
//  EditCandyViewController.m
//  NewCandy2
//
//  Created by Luke Solomon on 9/22/14.
//  Copyright (c) 2014 Luke Solomon. All rights reserved.
//

#import "EditCandyViewController.h"
#import "Candy.h"
#import "TableViewController.h"
#import "AppDelegate.h"

@interface EditCandyViewController ()
@property (weak, nonatomic) IBOutlet UITextField *editLatitudeField;
@property (weak, nonatomic) IBOutlet UITextField *editLongitudeField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *candyName;
@property (weak, nonatomic) IBOutlet UIButton *takePhotoButton;
@property (weak, nonatomic) IBOutlet UIButton *selectPhotoButton;

@property (nonatomic,strong) UIImage* image;

@end

@implementation EditCandyViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.candyName.text = self.candy.name;
    self.editLatitudeField.text = [NSString stringWithFormat:@"%@", self.candy.latitude];
    self.editLongitudeField.text = [NSString stringWithFormat:@"%@", self.candy.longitude];
    //self.imageView.image = [UIImage imageWithData:self.candy.image];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageWithData:self.candy.image];
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
    
    
    NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
    
    self.candy.image = imageData;

//        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"placeholder" ofType:@"png"];
//        self.candy.image = UIImagePNGRepresentation([UIImage imageWithContentsOfFile:imagePath]);
//    
//    
    [(AppDelegate *)[UIApplication sharedApplication].delegate saveContext];

}

- (IBAction)takePhotoPressed:(id)sender {
    
    UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
    
    imagePickerController.delegate = self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
}

- (IBAction)selectPhotoPressed:(id)sender {
    
    UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
    
    imagePickerController.delegate = self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    

    [picker dismissModalViewControllerAnimated:YES];
    
    NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
    self.candy.image = imageData;
    self.imageView.image = image;
    
}

@end
