//
//  ShopListViewController.m
//  SoftCore
//
//  Created by MacBook Pro Retina on 9/6/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "ShopListViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ShopListViewController ()

@end

@implementation ShopListViewController

- (void)viewDidLoad {
    self.title=@"SoftRockGroup";

    [super viewDidLoad];
    _addressLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _addressLabel.numberOfLines = 0;
    _addressLabel.text=[_dic objectForKey:@"address"];
    _numberLabel.text=[_dic objectForKey:@"phone"];
    _emailLabel.text=[_dic objectForKey:@"mail"];
    NSString *map=[_dic objectForKey:@"street"];
    
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error;
        NSString *url_string1 = [NSString stringWithFormat:@"%@", map];
        NSData *data1 = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string1]];
        NSMutableDictionary *json1 = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
        NSLog(@"%@",json1);
        
        
        
    });
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, _viewForWebView.frame.size.width, _viewForWebView.frame.size.height)]; // change frame that you need
    webView.navigationDelegate = self;
    NSURL *nsurl=[NSURL URLWithString:[_dic objectForKey:@"maps"]];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl]; // you can set here HTML content too.
    [webView loadRequest:nsrequest];
    
    
    NSString *embedHTML = [NSString stringWithFormat:@"<html><head><title>.</title><style>body,html,iframe{margin:0;padding:0;}</style></head><body><iframe width=\"%f\" height=\"%f\" src=\"%@\" frameborder=\"0\" allowfullscreen></iframe></body></html>" ,_viewForWebView.frame.size.width,_viewForWebView.frame.size.height, nsurl];
    
    [webView loadHTMLString:embedHTML baseURL:nsurl];
    
    
    
    [_viewForWebView addSubview:webView];
    
    NSString*link1=@"https://www.softrockgroup.com/public/upload/thumbnail/";
    [_imageViewForImage sd_setImageWithURL:[NSURL URLWithString:[link1 stringByAppendingString:[_dic objectForKey:@"image"]]]
            placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    _imageViewForImage.contentMode=UIViewContentModeScaleToFill;
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

- (IBAction)gotoPreviousView:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
    
}
@end
