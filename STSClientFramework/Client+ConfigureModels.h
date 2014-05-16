//
//  Client+ConfigureModels.h
//  STSClientFramework
//
//  Created by Stadelman, Stan on 5/16/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import "Client.h"

@class MyObject;

@interface Client (ConfigureModels)

//Configure Models
+(void)configureObjectModel:(MyObject *)model withDictionary:(NSDictionary *)dictionary;


@end
