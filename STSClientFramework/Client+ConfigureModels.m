//
//  Client+ConfigureModels.m
//  STSClientFramework
//
//  Created by Stadelman, Stan on 5/16/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//


#import "Client+ConfigureModels.h"

#import "MyObject.h"

@implementation Client (ConfigureModels)

#pragma mark Model Configuration

+(void)configureObjectModel:(MyObject *)model withDictionary:(NSDictionary *)dictionary
{

    model.myProperty = dictionary[@"myProperty"];

}

@end
