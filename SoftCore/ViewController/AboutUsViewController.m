//
//  AboutUsViewController.m
//  SoftCore
//
//  Created by MacBook Pro Retina on 8/6/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()
{
    NSMutableArray *currentArrayforSection3;
}

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentArrayforSection3=[[NSMutableArray alloc]init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error;
        NSString *url_string1 = [NSString stringWithFormat:@"http://softrockgroup.com/msitabout-us"];
        NSData *data1 = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string1]];
        NSMutableDictionary *json1 = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
        
        
        if(error==nil && self->currentArrayforSection3.count<=0)
        {
            self->currentArrayforSection3=json1;
            NSDictionary *dic=self->currentArrayforSection3[8];
            NSString *temp=[dic objectForKey:@"option_value"];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                 
            });
            
        }
    });
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
