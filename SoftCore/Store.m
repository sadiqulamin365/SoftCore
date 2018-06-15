//
//  Store.m
//  SoftCore
//
//  Created by MacBook Pro Retina on 7/6/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "Store.h"

@implementation Store

+(instancetype)sharedStore{
    static Store *sharedStore;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}
-(instancetype)initPrivate{
    self =[super init];
    array=[[NSMutableArray alloc]init];
    arrayforCraft=[[NSMutableArray alloc]init];
    
    return self;
}
 -(void)addObject:(NSDictionary*)dic
{
    [array addObject:dic];
}
-(void)deleteObject:(int)index{
    [array removeObjectAtIndex:index];
}
-(NSMutableArray*)getArray{
    return array;
}
-(void)addObjectforCraft:(NSDictionary*)dic
{
    [arrayforCraft addObject:dic];
}
-(void)deleteObjectforCraft:(int)index{
    [arrayforCraft removeObjectAtIndex:index];
}
-(NSMutableArray*)getArrayforCraft{
    return arrayforCraft;
}
@end
