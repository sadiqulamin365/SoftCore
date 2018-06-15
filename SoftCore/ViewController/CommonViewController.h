//
//  CommonViewController.h
//  SoftCore
//
//  Created by MacBook Pro Retina on 2/6/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonViewController : UIViewController
@property(nonatomic,strong)NSString *id;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewForAlldata;

- (IBAction)gotoPreviousView:(id)sender;

- (IBAction)GotoSerachBer:(id)sender;
- (IBAction)gotoView:(id)sender;

@end
