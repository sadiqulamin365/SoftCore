//
//  Store.h
//  SoftCore
//
//  Created by MacBook Pro Retina on 7/6/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Store : NSObject
{
    NSMutableArray *array;
    NSMutableArray *arrayforCraft;
    
}
+(instancetype)sharedStore;
-(void)addObject:(NSDictionary*)dic;
-(void)deleteObject:(int)index;
-(NSMutableArray*)getArray;

-(void)addObjectforCraft:(NSDictionary*)dic;
-(void)deleteObjectforCraft:(int)index;
-(NSMutableArray*)getArrayforCraft;
@end
