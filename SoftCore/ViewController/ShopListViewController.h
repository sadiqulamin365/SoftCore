//
//  ShopListViewController.h
//  SoftCore
//
//  Created by MacBook Pro Retina on 9/6/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface ShopListViewController : ViewController

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewForImage;

@property(nonatomic,strong) NSDictionary *dic;

- (IBAction)gotoPreviousView:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *viewForWebView;

@end
