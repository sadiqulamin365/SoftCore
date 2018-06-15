//
//  SearchBarViewController.h
//  SoftCore
//
//  Created by MacBook Pro Retina on 7/6/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "ViewController.h"

@interface SearchBarViewController : ViewController

- (IBAction)gotoPreviousView:(id)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewForAll;
@property (weak, nonatomic) IBOutlet UISearchBar *serachBer;

@end
