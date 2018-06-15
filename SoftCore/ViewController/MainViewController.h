//
//  MainViewController.h
//  PopertyQueenMalaysia
//
//  Created by MacBook Pro Retina on 30/4/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "ViewController.h"

@interface MainViewController : ViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButton;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewForCategories;


@property (weak, nonatomic) IBOutlet UIView *viewHieght;
@property (weak, nonatomic) IBOutlet UIView *viewForShowingImage;
@property (weak, nonatomic) IBOutlet UIView *viewForLatestProduct;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewForLatestProduct;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpaceOfView;

@property (weak, nonatomic) IBOutlet UILabel *homeLabel;

@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@property (weak, nonatomic) IBOutlet UIButton *hotOffer;

@property (weak, nonatomic) IBOutlet UILabel *hotOfferLabel;

@property (weak, nonatomic) IBOutlet UIButton *wishListButton;

@property (weak, nonatomic) IBOutlet UILabel *wishListLabel;


- (IBAction)goToHomePage:(id)sender;


- (IBAction)gotoHotOffer:(id)sender;


- (IBAction)gotoWishList:(id)sender;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UITableView *tableViewForData;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingSpaceOfView;

- (IBAction)gotoSearchBer:(id)sender;

- (IBAction)gotoFavouriteBar:(id)sender;


@end
