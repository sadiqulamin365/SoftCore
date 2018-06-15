//
//  WishListViewController.h
//  SoftCore
//
//  Created by MacBook Pro Retina on 30/5/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "ViewController.h"

@interface WishListViewController : ViewController
@property(nonatomic)BOOL isForApi;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;


- (IBAction)barButtonAction:(id)sender;


@end
