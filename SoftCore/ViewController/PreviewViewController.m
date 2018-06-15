//
//  PreviewViewController.m
//  SoftCore
//
//  Created by MacBook Pro Retina on 4/6/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "PreviewViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "OderClassViewController.h"
#import "Store.h"
#import "AddToCraftViewController.h"

@interface PreviewViewController ()

@end

@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"SoftRockGroup";
    [self performSelector:@selector(updateConstrain) withObject:self afterDelay:0.1];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    NSString*link1=@"https://www.softrockgroup.com/public/upload/";
    link1=[link1 stringByAppendingPathComponent:[_dic objectForKey:@"image"]];
   
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_imageviewForImage sd_setImageWithURL:[NSURL URLWithString:link1]
                                        placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            
            self->_labelForImageDescription.text=[self->_dic objectForKey:@"title"];
            
            [self->_labelForImageDescription setFont:[UIFont boldSystemFontOfSize:20]];
            self->_labelForPrice.text=[self->_dic objectForKey:@"price"];
            self->_labelForPrice.textColor=[UIColor redColor];
            self->_labelForPrice.textAlignment = UITextAlignmentCenter;
            NSString *text=[self->_dic objectForKey:@"short_desc"];
            
            if([text isKindOfClass:[NSNull class]])        {
                self->_labelForTotal.text=@"";
            }
            else{
                text=[text stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
                text=[text stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
                self->_labelForTotal.text=text;
            }
            
        });
      
 
 
        
    });
}
-(void)updateConstrain
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        if (screenSize.height == 812)
            _bottomSpaceForButtonView.constant=20.0;
    }
}

- (IBAction)gotoPreviusView:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)gotoOderView:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    
    OderClassViewController *add =
    [storyboard instantiateViewControllerWithIdentifier:@"OderClassViewController"];
    add.price=[_dic objectForKey:@"price"];
    add.img=_imageviewForImage.image;
    add.text=[self->_dic objectForKey:@"title"];
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:add];
    
    
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];

    
}

- (IBAction)gotoCraft:(id)sender {
    [[Store sharedStore]addObjectforCraft:_dic];
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    
    AddToCraftViewController *add =
    [storyboard instantiateViewControllerWithIdentifier:@"AddToCraftViewController"];
  
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:add];
    
    
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];
    
    
}
@end
