//
//  WishListViewController.m
//  SoftCore
//
//  Created by MacBook Pro Retina on 30/5/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "WishListViewController.h"
#import "InformationContainerTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Store.h"
#import "ShopListViewController.h"


@interface WishListViewController ()
{
    NSMutableArray *listItems;
    NSMutableArray *uniqueYears;
    NSMutableArray *currentArrayforSection3;
}
@property (weak, nonatomic) IBOutlet UITableView *tableViewForCurrentSelectedOption;

@end

@implementation WishListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.title=@"SoftRockGroup";
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    
    if(_isForApi==NO)
    {
        _barButtonItem.enabled=NO;
        _barButtonItem.tintColor=[UIColor clearColor];
        currentArrayforSection3=[[NSMutableArray alloc]initWithArray:[[Store sharedStore]getArray]];
        [self->_tableViewForCurrentSelectedOption reloadData];
    }
    else{
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSError *error;
            NSString *url_string1 = [NSString stringWithFormat:@"http://softrockgroup.com/droid-shoplist"];
            NSData *data1 = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string1]];
            NSMutableDictionary *json1 = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
            
            
            if(error==nil && self->currentArrayforSection3.count<=0)
            {
                self->currentArrayforSection3=json1;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self->_tableViewForCurrentSelectedOption reloadData];
                });
                
            }
        });
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(currentArrayforSection3.count>0)
        return currentArrayforSection3.count;
    else
        return  0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSDictionary *dic=currentArrayforSection3[indexPath.row];
    if(_isForApi==YES)
    {
        cell1.textLabel.text=[dic objectForKey:@"title"];;
        cell1.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell1;
    }
    
    InformationContainerTableViewCell  *cell = (InformationContainerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSString *link=@"https://www.softrockgroup.com/public/upload/thumbnail/";
    
    
    
   
    
    if(_isForApi==NO)
    {
        cell.titleLabel.hidden=NO;
        cell.priceLabel.hidden=NO;
        cell.deletecurrentOption.hidden=NO;
        cell.titleLabel.text=[dic objectForKey:@"title"];
        cell.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.titleLabel.numberOfLines = 0;
        cell.imageViewForImage.hidden=NO;
        
        cell.priceLabel.text=[dic objectForKey:@"price"];
        cell.priceLabel.textColor=[UIColor redColor];
        
        NSString *temp=[link stringByAppendingString:[dic objectForKey:@"image"]];
        cell.imageViewForImage.contentMode=UIViewContentModeScaleToFill;
        [cell.imageViewForImage sd_setImageWithURL:[NSURL URLWithString:temp]
                                  placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        
        [cell.imageViewForImage setClipsToBounds:YES];
        
        
        cell.tempView.layer.cornerRadius =5;
        cell.tempView.layer.masksToBounds = YES;
        
        cell.tempView.layer.shadowColor = [UIColor whiteColor].CGColor;
        cell.tempView.layer.shadowOffset = CGSizeMake(0, 2.0f);
        cell.tempView.layer.shadowRadius = 2.0f;
        cell.tempView.layer.shadowOpacity = 1.0f;
        cell.tempView.layer.masksToBounds = NO;
        cell.tempView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:cell.contentView.layer.cornerRadius].CGPath;
        cell.tempView.backgroundColor=[UIColor clearColor];
        
        
        cell.imageViewForImage.layer.cornerRadius =5;
        cell.imageViewForImage.layer.masksToBounds = YES;
        
        cell.imageViewForImage.layer.shadowColor = [UIColor whiteColor].CGColor;
        cell.imageViewForImage.layer.shadowOffset = CGSizeMake(0, 2.0f);
        cell.imageViewForImage.layer.shadowRadius = 2.0f;
        cell.imageViewForImage.layer.shadowOpacity = 1.0f;
        cell.imageViewForImage.layer.masksToBounds = NO;
        cell.imageViewForImage.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:cell.contentView.layer.cornerRadius].CGPath;
        cell.imageViewForImage.backgroundColor=[UIColor clearColor];
        cell.deletecurrentOption.tag=3000+indexPath.row;
        [cell.deletecurrentOption addTarget:self
                                     action:@selector(deleteTheRow:)
                           forControlEvents:UIControlEventTouchUpInside];
        [cell.imageViewForImage setClipsToBounds:YES];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    ShopListViewController *add =
    [storyboard instantiateViewControllerWithIdentifier:@"ShopListViewController"];
   
    add.dic=currentArrayforSection3[indexPath.row];
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:add];
    
    
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];
    
}
-(void)deleteTheRow:(id)sender
{
    UIButton *btn=(UIButton*)sender;
    int value=(int)btn.tag-3000;
    
    [[Store sharedStore]deleteObject:value];
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        currentArrayforSection3=[[NSMutableArray alloc]initWithArray:[[Store sharedStore]getArray]];
        [self->_tableViewForCurrentSelectedOption reloadData];
    });
}
- (IBAction)barButtonAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
    
}
@end
