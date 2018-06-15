//
//  OderClassViewController.h
//  SoftCore
//
//  Created by MacBook Pro Retina on 5/6/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OderClassViewController : UIViewController
- (IBAction)gotoPreViousView:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageToShow;
@property(nonatomic,strong)UIImage *img;
@property (weak, nonatomic) IBOutlet UILabel *dressName;
@property(nonatomic,strong) NSString *text;

@property (weak, nonatomic) IBOutlet UILabel *elemnt_NO;

- (IBAction)gotoOder:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *elemntNo;
@property (weak, nonatomic) IBOutlet UITextView *textView1;

@property (weak, nonatomic) IBOutlet UITextView *textView2;

@property (weak, nonatomic) IBOutlet UITextView *textView3;

@property (weak, nonatomic) IBOutlet UITextView *textView4;

@property (weak, nonatomic) IBOutlet UIView *tempViewFortextView;

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIButton *button1;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpaceTomainView;
@property (weak, nonatomic) IBOutlet UILabel *labelText;

@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UILabel *LASTProduct;
@property(nonatomic,strong) NSString *price;


@end
