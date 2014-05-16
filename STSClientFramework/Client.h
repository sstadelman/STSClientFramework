//
//  Client.h
//  STSClientFramework
//
//  Created by Stadelman, Stan on 5/16/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SODataStore.h"
#import "SODataStoreSync.h"
#import "SODataStoreAsync.h"

@interface Client : NSObject

@property (nonatomic) id <SODataStore, SODataStoreSync, SODataStoreAsync> store;

+(instancetype)sharedClient;

+ (RACSignal *)fetchSomeObjects:(NSDictionary *)parameters;


//Flights

+ (RACSignal *)fetchCarriers;
-(void)scheduleRequestForResource:(NSString *)resourcePath withMethod:(NSString *) method withCompletion:(void(^)(NSArray *array))completion;

//Used with NSURLSession, directly
//-(void)download:(NSString *)urlString withCompletion:(void(^)(NSData *data))completion;

@end
