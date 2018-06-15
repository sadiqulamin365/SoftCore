    //
//  MainViewController.m
//  PopertyQueenMalaysia
//
//  Created by MacBook Pro Retina on 30/4/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "InformationCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "CommonViewController.h"
#import "PreviewViewController.h"
#import "Store.h"
#import "SearchBarViewController.h"
#import "WishListViewController.h"
#import "AboutUsViewController.h"
#import "AddToCraftViewController.h"

@interface MainViewController ()
{
    NSMutableArray *viewControllerConatiner;
    NSMutableArray *indentifier;
    UIViewController *initialViewController;
    UIScrollView *scrollView;
    NSMutableArray  *currentArrayforSection2;
    NSMutableArray  *currentArrayforSection1;
    NSMutableArray  *currentArrayforSection3;
    UIScrollView *scr;
    UIPageControl *pgCtr;
    UIColor *currentColor;
    NSMutableArray *currentArray;
    
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setTintColor:[UIColor redColor]];
    
    
  
    
    
    self.searchBar.delegate=self;
    currentArrayforSection3=[[NSMutableArray alloc]init];
    if(currentColor==nil)
    {
        currentColor=_homeLabel.textColor;
    }
    _homeLabel.textColor=[UIColor whiteColor];
    [_homeButton setImage:[UIImage imageNamed:@"home_active"]   forState:UIControlStateNormal];
    NSLog(@"%f %f %f",_viewForShowingImage.frame.size.height,_viewHieght.frame.size.height,_viewForLatestProduct.frame.size.height);
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.menuBarButton setTarget: self.revealViewController];
        [self.menuBarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    currentArrayforSection2=[[NSMutableArray alloc]init];
    currentArrayforSection1=[[NSMutableArray alloc]init];
    currentArray=[[NSMutableArray alloc]init];
    [currentArray addObject:@"About Us"];
    [currentArray addObject:@"Contact Us"];
    [currentArray addObject:@"Shop List"];
    
    
}

-(void)AcionFirst:(id)sender
{
    //do something for first bar button
    
}

-(void)AcionSecond:(id)sender
{
    //do something for second bar button
}
-(void)setUpPageController
{
    
    scr=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, _viewForShowingImage.frame.size.height)];
    scr.tag = 1;
    scr.autoresizingMask=UIViewAutoresizingNone;
    [_viewForShowingImage  addSubview:scr];
    [self setupScrollView:scr];
    pgCtr = [[UIPageControl alloc] initWithFrame:CGRectMake(0,_viewForShowingImage.frame.size.height-40,self.view.frame.size.width, 40)];
    [pgCtr setTag:12];
    pgCtr.numberOfPages=currentArrayforSection1.count;
    pgCtr.autoresizingMask=UIViewAutoresizingNone;
    pgCtr.backgroundColor=[UIColor clearColor];
    pgCtr.userInteractionEnabled=NO;
    scr.bounces=NO;
    scr.bouncesZoom=NO;
    scr.delegate=self;
    scr.showsVerticalScrollIndicator=NO;
    scr.showsHorizontalScrollIndicator=NO;
    [_viewForShowingImage addSubview:pgCtr];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.tintColor=[UIColor colorWithRed:15.0/255.0 green:103.0/255.0 blue:59.0/255.0 alpha:1.0];
     _bottomSpaceOfView.constant=0.0;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        if (screenSize.height == 812)
           
            _bottomSpaceOfView.constant=20.0;
            
            }
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error;
        NSString *url_string1 = [NSString stringWithFormat:@"https://www.softrockgroup.com/droid-slider"];
        NSData *data1 = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string1]];
        NSMutableArray *json1 = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
        
        
        if(error==nil && self->currentArrayforSection1.count<=0)
        {
            
            for(int i=0;i<json1.count;i++)
            {
                [self->currentArrayforSection1 addObject:json1[i]];
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setUpPageController];
            });
            
        }
    });
    
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error;
        NSString *url_string1 = [NSString stringWithFormat:@"https://www.softrockgroup.com/droid-latest-product"];
        NSData *data1 = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string1]];
        NSMutableDictionary *json1 = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
        
        
        if(error==nil && self->currentArrayforSection3.count<=0)
        {
            self->currentArrayforSection3=[json1 objectForKey:@"data"];
            
          
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->_collectionViewForLatestProduct reloadData];
            });
            
        }
    });
    
    
    
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error;
        NSString *url_string1 = [NSString stringWithFormat: @"https://www.softrockgroup.com/even-number-category"];
        NSData *data1 = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string1]];
        NSMutableArray *json1 = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
        
        NSString *url_string2 = [NSString stringWithFormat: @"https://www.softrockgroup.com/odd-number-category"];
        NSData *data2 = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string2]];
        NSMutableArray *json2 = [NSJSONSerialization JSONObjectWithData:data2 options:kNilOptions error:&error];
        
        if(error==nil && self->currentArrayforSection2.count<=0)
        {
            
            for(int i=0;i<json1.count;i++)
            {
                [self->currentArrayforSection2 addObject:json1[i]];
                [currentArray addObject:json1[i]];
            }
            for(int i=0;i<json2.count;i++)
            {
                [self->currentArrayforSection2 addObject:json2[i]];
                [currentArray addObject:json2[i]];
            }
           
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->_collectionViewForCategories reloadData];
                [self->_tableViewForData reloadData];
                
            });
            
        }
    });
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CGSize size;
    
    
    double theWidth;
    if([collectionView isEqual:_collectionViewForCategories])
      theWidth= (self.view.frame.size.width-32)/3;
    else
        theWidth= (self.view.frame.size.width-60)/2;
    double theHeight = (_viewHieght.frame.size.height-56 -24)/2;   // it will generate 3 Row
    
  
    
    size=CGSizeMake(theWidth, theHeight);
    return size;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if([collectionView isEqual:_collectionViewForCategories])
        return   currentArrayforSection2.count;
    else if([collectionView isEqual:_collectionViewForLatestProduct])
        return currentArrayforSection3.count;
    else
        return 0;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString*link1=@"https://www.softrockgroup.com/public/upload/";
    NSString *link2=@"https://www.softrockgroup.com/public/upload/thumbnail/";
    NSString *link;
    NSDictionary *dic;
    if([collectionView isEqual:_collectionViewForCategories])
    {    dic=currentArrayforSection2[indexPath.row];
        link=link1;
    }else{
        dic=currentArrayforSection3[indexPath.row];
        link=link2;
    }
    InformationCollectionViewCell  *cell = (InformationCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *temp=[link stringByAppendingString:[dic objectForKey:@"image"]];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:temp]
                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    [cell.imageView setClipsToBounds:YES];
     if([collectionView isEqual:_collectionViewForCategories])
         
     {
        cell.label.textColor=[UIColor colorWithRed:252.0/255.0 green:68.0/255.0 blue:130.0/255.0 alpha:1.0];
         cell.backgroundColor=[UIColor whiteColor];
        cell.label.text=[dic objectForKey:@"category_name"];
     }
    else
    {
         cell.backgroundColor=[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
        cell.label.textColor=[UIColor blackColor];
        cell.label.text=[dic objectForKey:@"title"];
        cell.labelForMoney.text=[dic objectForKey:@"price"];
        cell.labelForMoney.textAlignment=NSTextAlignmentCenter;
        cell.label.lineBreakMode = NSLineBreakByWordWrapping;
        cell.label.numberOfLines = 0;
        cell.labelForMoney.textColor=[UIColor colorWithRed:252.0/255.0 green:68.0/255.0 blue:130.0/255.0 alpha:1.0];
        [cell.buttonForWish addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        cell.buttonForWish.tag=8000+indexPath.row;
       cell.imageView.contentMode=UIViewContentModeScaleToFill;
       
    }
    
  
    [cell.label sizeToFit];
    [cell.label setFont:[UIFont boldSystemFontOfSize:13]];
    cell.label.textAlignment=NSTextAlignmentCenter;
    
    
   
    
    cell.contentView.layer.cornerRadius = 2.0f;
    cell.contentView.layer.borderWidth = 1.0f;
    cell.contentView.layer.borderColor = [UIColor clearColor].CGColor;
    cell.contentView.layer.masksToBounds = YES;
    
    
    
    cell.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    cell.layer.shadowOffset = CGSizeMake(0, 2.0f);
    cell.layer.shadowRadius = 2.0f;
    cell.layer.shadowOpacity = 1.0f;
    cell.layer.masksToBounds = NO;
    cell.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:cell.contentView.layer.cornerRadius].CGPath;
    
    
    
    return cell;
    
    
}
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic;
    if([collectionView isEqual:_collectionViewForCategories])
    {    dic=currentArrayforSection2[indexPath.row];
        [self gotoView:dic];
       
    }else{
        dic=currentArrayforSection3[indexPath.row];
        [self gotoCommonPreviewView:dic];
        
    }
}

- (IBAction)btnClicked:(id)sender
{
    UIButton *btn=(UIButton*)sender;
    NSDictionary *dic=dic=currentArrayforSection3[btn.tag-8000];
    [[Store sharedStore]addObject:dic];
    
    
}
- (void)setupScrollView:(UIScrollView*)scrMain {
    NSString*link1=@"https://www.softrockgroup.com/public/upload/";
    
    for (int i=0; i<currentArrayforSection1.count;i++) {
        
        NSDictionary *dic=currentArrayforSection1[i];
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((i)*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height)];
        UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake((i)*scrMain.frame.size.width, scrMain.frame.size.height-40, scrMain.frame.size.width, 40)];
        lbl.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.4];        lbl.text=[dic objectForKey:@"title"];
        lbl.textColor=[UIColor whiteColor];
        [imgV sd_setImageWithURL:[NSURL URLWithString:[link1 stringByAppendingString:[dic objectForKey:@"image"]]]
                placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        imgV.contentMode=UIViewContentModeScaleToFill;
        imgV.tag=i+8000;
        [scrMain addSubview:imgV];
        [scrMain addSubview:lbl];
    }
    
    [scrMain setContentSize:CGSizeMake(scrMain.frame.size.width*currentArrayforSection1.count, scrMain.frame.size.height)];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat contentOffset = scr.contentOffset.x;
    // calculate next page to display
    NSString*link1=@"https://www.softrockgroup.com/public/upload/";
    int nextPage = (int)(contentOffset/scr.frame.size.width) ;
    // if page is not 10, display it
    if( nextPage!=currentArrayforSection1.count )  {
        UIImageView *imgV=(UIImageView*)[scr viewWithTag:8000+nextPage];
        NSDictionary *dic=currentArrayforSection1[nextPage];
        NSString *temp=[link1 stringByAppendingString:[dic objectForKey:@"image"]];
        [imgV sd_setImageWithURL:[NSURL URLWithString:[link1 stringByAppendingString:[dic objectForKey:@"image"]]]
                placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        [scr scrollRectToVisible:CGRectMake(nextPage*scr.frame.size.width, 0, scr.frame.size.width, scr.frame.size.height) animated:YES];
        pgCtr.currentPage=nextPage;
        // else start sliding form 1 :)
    } else {
        [scr scrollRectToVisible:CGRectMake(0, 0, scr.frame.size.width, scr.frame.size.height) animated:YES];
        pgCtr.currentPage=0;
    }
}
- (IBAction)goToHomePage:(id)sender {
    _homeLabel.textColor=[UIColor whiteColor];
    [_homeButton setImage:[UIImage imageNamed:@"home_active"]   forState:UIControlStateNormal];
    
    _wishListLabel.textColor=currentColor;
    [_wishListButton setImage:[UIImage imageNamed:@"wishlist_inactive"]   forState:UIControlStateNormal];
    _hotOfferLabel.textColor=currentColor;
    [_hotOffer setImage:[UIImage imageNamed:@"hot_offer_inactive"]   forState:UIControlStateNormal];
    
}

- (IBAction)gotoHotOffer:(id)sender {
    _homeLabel.textColor=currentColor;
    [_homeButton setImage:[UIImage imageNamed:@"home_inactive"]   forState:UIControlStateNormal];
    
    _wishListLabel.textColor=currentColor;
    [_wishListButton setImage:[UIImage imageNamed:@"wishlist_inactive"]   forState:UIControlStateNormal];
    _hotOfferLabel.textColor=[UIColor whiteColor];
     [_hotOffer setImage:[UIImage imageNamed:@"hot_offer_active"]   forState:UIControlStateNormal];
    
    
}

- (IBAction)gotoWishList:(id)sender {
    _homeLabel.textColor=currentColor;
    [_homeButton setImage:[UIImage imageNamed:@"home_inactive"]   forState:UIControlStateNormal];
    _wishListLabel.textColor=[UIColor whiteColor];
    [_wishListButton setImage:[UIImage imageNamed:@"wishlist_active"]   forState:UIControlStateNormal];
    
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return currentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    if(indexPath.row>2)
    {
        cell.textLabel.text = [currentArray[indexPath.row] objectForKey:@"category_name"];
    }
    else{
        cell.textLabel.text=currentArray[indexPath.row];
        
    }
    
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.textAlignment=NSTextAlignmentLeft;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString *link=@"https://www.softrockgroup.com/1";
    NSDictionary *dic=currentArray[indexPath.row];
    
    
    if(indexPath.row<=2)
    {
        if(indexPath.row==0)
        {
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                                 bundle:nil];
            
            AboutUsViewController *add =
            [storyboard instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
           
            
            UINavigationController *navigationController =
            [[UINavigationController alloc] initWithRootViewController:add];
            
            
            [self presentViewController:navigationController
                               animated:YES
                             completion:nil];
        }
        else if(indexPath.row==1)
        {
             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.softrockgroup.com/contact-us"] options:@{} completionHandler:nil];
        }
        else{
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            WishListViewController *add =
            [storyboard instantiateViewControllerWithIdentifier:@"WishListViewController"];
            add.isForApi=YES;
            UINavigationController *navigationController =
            [[UINavigationController alloc] initWithRootViewController:add];
            
            
            [self presentViewController:navigationController
                               animated:YES
                             completion:nil];
        }
    }
    
    
   else  if([dic isKindOfClass:[NSDictionary class]])
    {
        NSString *temp=[NSString stringWithFormat:@"%d",1];
        link=[link stringByAppendingString:temp];
    }
    [UIView animateWithDuration:0.5 animations:^{
        
        
        self->_leadingSpaceOfView.constant=-400;
        [self.view layoutIfNeeded];
        
    } completion: ^(BOOL finished) {
        
        if(indexPath.row>2)
        [self gotoView:dic];
      
        
        
    }];
    
}
-(void)gotoView:(NSDictionary*)dic
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    CommonViewController *add =
    [storyboard instantiateViewControllerWithIdentifier:@"CommonViewController"];
    int v=(int)[dic[@"category_id"] integerValue];
    add.id=[NSString stringWithFormat:@"%d",v];
    
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:add];
    
    
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];
}
- (IBAction)gotoMenuBar:(id)sender {
    double v=_leadingSpaceOfView.constant;
    
    if(v<0)
    {
        v=0;
    }
    else{
        v=-700;
    }
    [UIView animateWithDuration:0.5 animations:^{
        
        
        self->_leadingSpaceOfView.constant=v;
        [self.view layoutIfNeeded];
        
    } completion: ^(BOOL finished) {
       
    }];
}
-(void)gotoCommonPreviewView:(NSDictionary*)dic
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    
    PreviewViewController *add =
    [storyboard instantiateViewControllerWithIdentifier:@"PreviewViewController"];
    int v=(int)[dic[@"id"] integerValue];
    add.dic=dic;
    
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:add];
    
    
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];
}
- (IBAction)gotoSearchBer:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    
    SearchBarViewController *add =
    [storyboard instantiateViewControllerWithIdentifier:@"SearchBarViewController"];
  
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:add];
    
    
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];
}

- (IBAction)gotoFavouriteBar:(id)sender {
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
