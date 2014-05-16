//
//  Client.m
//  STSClientFramework
//
//  Created by Stadelman, Stan on 5/16/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import "Client.h"
#import "Client+ConfigureModels.h"

#import "MyObject.h"

@interface Client() <NSURLSessionDelegate> {
}

@end

@implementation Client

+(instancetype)sharedClient
{
    static id _sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient= [[Client alloc] init];
    });
    
    return _sharedClient;
}

-(instancetype)init
{
    if (self == [super init]) {
        return self;
    }
    return nil;
}


// Fetch objects, using NSURLSession

+ (RACReplaySubject *)fetchSomeObjects:(NSDictionary *)parameters
{
    RACReplaySubject *subject = [RACReplaySubject subject];
    
    NSString *urlString;
    if (!!parameters) {
        urlString = @"http://services.odata.org/gimme/some/mfn/data/mycollection/";
    } else {
        urlString = parameters[@"url"];
    }
    
    [[Client sharedClient] download:urlString withCompletion:^(NSData *data) {
        if (data) {
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            [subject sendNext:[[[results[@"value"] rac_sequence] map:^id(NSDictionary *value) {
                
                MyObject *model = [MyObject new];
                [Client configureObjectModel:model withDictionary:value];
                
                return model;
            }] array]];
            [subject sendCompleted];
        } else {
            [subject sendError:nil];
        }
    }];
    return subject;
}




#pragma mark Network APIs
-(void)download:(NSString *)urlString withCompletion:(void(^)(NSData *data))completion
{
    NSAssert(urlString, @"The URL must not be nil");
    NSString *encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:encodedString]];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.HTTPAdditionalHeaders = @{
                                     @"Content-Type": @"application/json",
                                     @"Accept": @"application/json",
                                     @"Connection": @"Keep-Alive"
                                     };
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:[Client sharedClient] delegateQueue:nil];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(!error) {
            completion(data);
        } else {
            NSLog(@"error = %@, %@", error, [error userInfo]);
        }
    }];
    
    [dataTask resume];
}

#pragma mark - NSURLSessionDelegate

-(void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
{
    
    NSURLCredential *newCredential = [NSURLCredential credentialWithUser:@"you"
                                                                password:@"yourPassword"
                                                             persistence:NSURLCredentialPersistenceForSession];
    
    completionHandler(NSURLSessionAuthChallengeUseCredential, newCredential);
    
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    NSLog(@"something completed = %@", [response description]);
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
{
    if ([challenge previousFailureCount] == 0) {
        
        if (!challenge.proposedCredential) {
            
            NSURLCredential *newCredential = [NSURLCredential credentialWithUser:@"you"
                                                                        password:@"yourPassword"
                                                                     persistence:NSURLCredentialPersistenceForSession];
            
            completionHandler(NSURLSessionAuthChallengeUseCredential, newCredential);

        }

    } else {
        
        [[challenge sender] cancelAuthenticationChallenge:challenge];
        // inform the user that the user name and password
        // in the preferences are incorrect
        NSLog(@"CREDENTIALS FAILED");
    }
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    NSLog(@"did complete with error = %@", [error description]);
}


@end
