//
//  OderClassViewController.m
//  SoftCore
//
//  Created by MacBook Pro Retina on 5/6/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "OderClassViewController.h"
#import <UNIRest.h>
#import <AFNetworking.h>




@interface OderClassViewController ()
{

}

@end

@implementation OderClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageToShow.image=_img;
    _imageToShow.contentMode=UIViewContentModeScaleAspectFit;
    _dressName.lineBreakMode = NSLineBreakByWordWrapping;
    _dressName.numberOfLines = 0;
    _dressName.text=_text;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureHandlerMethod:)];
    [_mainView addGestureRecognizer:tapRecognizer];
    _productPrice.text=[NSString stringWithFormat:@"%@%@",@"Price : ",_price];
    [_productPrice setFont:[UIFont systemFontOfSize:12]];
    
    _LASTProduct.text=[NSString stringWithFormat:@"%@%@",@"Amount : ",_price];
    [_LASTProduct setFont:[UIFont systemFontOfSize:12]];
    
    _textView1.delegate=self;
     _textView2.delegate=self;
     _textView3.delegate=self;
     _textView4.delegate=self;
    
    //
    //    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureHandlerMethod:)];
    //    [_textView1 addGestureRecognizer:tapRecognizer];
    //    _textView1.tag=1;
    //    [_textView2 addGestureRecognizer:tapRecognizer];
    //    _textView2.tag=2;
    //    [_textView3 addGestureRecognizer:tapRecognizer];
    //    _textView3.tag=3;
    //    [_textView4 addGestureRecognizer:tapRecognizer];
    //    _textView4.tag=1;
    
}
-(void)gestureHandlerMethod:(UITapGestureRecognizer*)sender {
    
    if([_textView1 isFirstResponder])
    {
        [_textView1 resignFirstResponder];
    }
    if([_textView2 isFirstResponder])
    {
        [_textView2 resignFirstResponder];
    }
    if([_textView3 isFirstResponder])
    {
        [_textView3 resignFirstResponder];
    }
    if([_textView4 isFirstResponder])
    {
        [_textView4 resignFirstResponder];
    }
    
    _topSpaceTomainView.constant=0;
    if(_textView1.text.length==0)
    {
        _textView1.text=@"Enter Your Name";
    }
    if(_textView2.text.length==0)
    {
        {
            _textView2.text=@"Enter Your Mail";
        }
        if(_textView3.text.length==0)
            
        {
            _textView3.text=@"Enter Your Number";
        }
        if(_textView4.text.length==0)
            
        {
            _textView4.text=@"Enter Your Address";
        }
        
    }
}

#pragma mark - Gesture recognizer delegate




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)increasingButton:(id)sender {
    NSString *text=_labelText.text;
    _labelText.text=[NSString stringWithFormat:@"%ld",[text integerValue]+1];
    double v=[_labelText.text doubleValue]*[_price doubleValue];
    _LASTProduct.text=[NSString stringWithFormat:@"%@%.0f",@"Amount : ",v];
    
}
- (IBAction)decreasingButton:(id)sender {
    NSString *text=_labelText.text;
    _labelText.text=[NSString stringWithFormat:@"%ld",MAX(1,[text integerValue]-1)];
    double v=[_labelText.text doubleValue]*[_price doubleValue];
    _LASTProduct.text=[NSString stringWithFormat:@"%@%.0f",@"Amount : ",v];
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)gotoPreViousView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)gotoOder:(id)sender {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
  
    
   
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSMutableDictionary *parameters =  [[NSMutableDictionary alloc]init];
    
    [parameters setValue:_textView1.text forKey:@"name"];
    [parameters setValue:_textView2.text forKey:@"email"];
    [parameters setValue:_textView3.text forKey:@"number"];
    [parameters setValue:_textView4.text forKey:@"address"];
    [parameters setObject:_labelText.text forKey:_dressName.text];
    
    
    [manager POST:@"https://www.softrockgroup.com/single_product_order" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"%@",[responseObject description]);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",[error localizedDescription]);
    }];
}


- (IBAction)gotoTextView1:(id)sender {
    if(![_textView1 isFirstResponder])
    {
        [_textView1 becomeFirstResponder];
    }
    else{
        [_textView1 resignFirstResponder];
    }
}
- (void)keyboardWillChange:(NSNotification *)notification {
    double v=[notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    

    _topSpaceTomainView.constant=-(1)*v;
    
    
   
    
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if([textView.text containsString:@"Enter"])
    {
        textView.text=@"";
    }

    
   
    return YES;
}

@end
