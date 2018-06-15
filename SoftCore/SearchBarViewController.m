//
//  SearchBarViewController.m
//  SoftCore
//
//  Created by MacBook Pro Retina on 7/6/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "SearchBarViewController.h"
#include "InformationCollectionViewCell.h"
#import <UNIRest.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "Store.h"


@interface SearchBarViewController ()
{
    NSMutableArray *currentArray;
    NSMutableArray *json1;
}

@end

@implementation SearchBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentArray=[[NSMutableArray alloc]init];
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [_collectionViewForAll addGestureRecognizer:singleFingerTap];
    
    //The event handling method
  
}
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    [_serachBer resignFirstResponder];
    
    //Do stuff here...
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSURL *url = [NSURL URLWithString:@"https://www.softrockgroup.com/droid-product-search"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];

    
    
    
    [request setHTTPMethod:@"POST"];

    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    NSDictionary *headers = @{@"accept": @"application/json"};
    NSDictionary *parameters = @{@"parameter": @"value", @"foo": @"bar"};
    
    [[UNIRest post:^(UNISimpleRequest *request) {
        [request setUrl:@"https://www.softrockgroup.com/droid-product-search"];
        [request setHeaders:headers];
        [request setParameters:parameters];
    }] asJsonAsync:^(UNIHTTPJsonResponse* response, NSError *error) {
        // This is the asyncronous callback block
       
        
      
        
    }];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data
{
    NSError *error;
    
      NSDictionary *dic= [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    json1=[dic objectForKey:@"data"];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return  currentArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CGSize size;
    
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        
        int mainViewWidth = [UIScreen mainScreen].bounds.size.width-16;
        int ViewWidth=(mainViewWidth-3*8)/4;
        int ViewHeight= (int)(ViewWidth+40);
        size= CGSizeMake(ViewWidth, ViewHeight);
        
        
    }
    else{
        int mainViewWidth = [UIScreen mainScreen].bounds.size.width-16;
        int ViewWidth=(mainViewWidth-8)/2;
        int ViewHeight= (int)(ViewWidth+40);
        size= CGSizeMake(ViewWidth, ViewHeight);
        
    }
    
    return size;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString*link1=@"https://www.softrockgroup.com/public/upload/";
    NSString *link2=@"https://www.softrockgroup.com/public/upload/thumbnail/";
    NSString *link;
    NSDictionary *dic;
    dic=currentArray[indexPath.row];
    InformationCollectionViewCell  *cell = (InformationCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    link1=[link1 stringByAppendingPathComponent:[dic objectForKey:@"image"]];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:link1]
                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    
    
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
    
    
    [cell.label sizeToFit];
    [cell.label setFont:[UIFont boldSystemFontOfSize:13]];
    cell.label.textAlignment=NSTextAlignmentCenter;
    cell.buttonForWish.hidden=YES;
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
    
    cell.buttonForWish.hidden=NO;
    
    return cell;
    
    
}
-(void)btnClicked:(id)sender
{
    UIButton *btn=(UIButton*)sender;
    NSDictionary *dic=currentArray[btn.tag-8000];
    [[Store sharedStore]addObject:dic];
    
    
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSString *myString = @"Hello, World!";
    NSString *lower = [myString lowercaseString];
    [currentArray removeAllObjects];
    
    for(int i=0;i<json1.count;i++)
    {
        NSDictionary *dic=json1[i];
        myString=[dic objectForKey:@"title"];
        myString=[myString lowercaseString];
        searchText=[searchText lowercaseString];
        
        if([myString containsString:searchText])
        {
            [currentArray addObject:dic];
        }
        
        
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [_collectionViewForAll reloadData];
    });
   
    NSLog(@"%@",searchText);
}
- (IBAction)gotoPreviousView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
