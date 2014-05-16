//
//  Client.h
//  STSClientFramework
//
//  Created by Stadelman, Stan on 5/16/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Client : NSObject

+(instancetype)sharedClient;

+ (RACSignal *)fetchSomeObjects:(NSDictionary *)parameters;

-(void)download:(NSString *)urlString withCompletion:(void(^)(NSData *data))completion;

@end
