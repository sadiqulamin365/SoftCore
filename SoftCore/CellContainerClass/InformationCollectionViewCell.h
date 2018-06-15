//
//  InformationCollectionViewCell.h
//  SoftCore
//
//  Created by MacBook Pro Retina on 25/5/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UILabel *labelForMoney;
@property (weak, nonatomic) IBOutlet UIButton *buttonForWish;

@end
