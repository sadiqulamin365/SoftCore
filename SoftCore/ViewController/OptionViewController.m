//
//  OptionViewController.m
//  PopertyQueenMalaysia
//
//  Created by MacBook Pro Retina on 30/4/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "OptionViewController.h"

@interface OptionViewController ()
{
    NSMutableArray  *nameArray;
    NSMutableArray  *currentArray;
    
    __weak IBOutlet UITableView *tableViewForCategory;
    
    
}

@end

@implementation OptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
    currentArray=[[NSMutableArray alloc]init];
    
    
    [currentArray addObject:@"About Us"];
    [currentArray addObject:@"Contact Us"];
    [currentArray addObject:@"Shop List"];
    
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error;
        NSString *url_string1 = [NSString stringWithFormat: @"https://www.softrockgroup.com/even-number-category"];
        NSData *data1 = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string1]];
        NSMutableArray *json1 = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
        
        NSString *url_string2 = [NSString stringWithFormat: @"https://www.softrockgroup.com/odd-number-category"];
        NSData *data2 = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string2]];
        NSMutableArray *json2 = [NSJSONSerialization JSONObjectWithData:data2 options:kNilOptions error:&error];
        
        if(error==nil && self->currentArray.count<=3)
        {
            
            for(int i=0;i<json1.count;i++)
            {
                [self->currentArray addObject:json1[i]];
            }
            for(int i=0;i<json2.count;i++)
            {
                [self->currentArray addObject:json2[i]];
            }
            
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self->tableViewForCategory reloadData];
            });
            
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
}

@end
