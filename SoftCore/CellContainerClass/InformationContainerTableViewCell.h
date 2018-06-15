//
//  InformationContainerTableViewCell.h
//  SoftCore
//
//  Created by MacBook Pro Retina on 30/5/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationContainerTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewForImage;

@property (weak, nonatomic) IBOutlet UIButton *deletecurrentOption;
@property (weak, nonatomic) IBOutlet UIView *tempView;

@end
