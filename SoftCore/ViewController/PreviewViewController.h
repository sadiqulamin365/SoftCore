//
//  PreviewViewController.h
//  SoftCore
//
//  Created by MacBook Pro Retina on 4/6/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreviewViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageviewForImage;

@property (weak, nonatomic) IBOutlet UILabel *labelForImageDescription;

@property (weak, nonatomic) IBOutlet UILabel *labelForPrice;

@property (weak, nonatomic) IBOutlet UILabel *labelForTotal;

@property(weak,nonatomic) NSDictionary *dic;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpaceForButtonView;

- (IBAction)gotoPreviusView:(id)sender;

- (IBAction)gotoOderView:(id)sender;

- (IBAction)gotoCraft:(id)sender;


@end
