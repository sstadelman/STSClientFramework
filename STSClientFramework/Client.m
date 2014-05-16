//
//  Client.m
//  STSClientFramework
//
//  Created by Stadelman, Stan on 5/16/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import "Client.h"
#import "Client+ConfigureModels.h"

//EPM
#import "BusinessPartner.h"
#import "SalesOrder.h"
#import "Contact.h"
#import "LineItem.h"

//Flights
#import "Carrier.h"
#import "FlightDetails.h"


#import "SODataOnlineStore.h"
#import "SODataOnlineStoreDelegate.h"
#import "SODataRequestCredentialsDelegate.h"
#import "SODataUserCredentials.h"

#import "STSODataOnlineStore.h"

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
        NSError *err;
        if (![[[NSUserDefaults standardUserDefaults] valueForKey:@"isOffline"] boolValue]) {
            // if not set for offline, use an online store
            self.store = (STSODataOnlineStore *)[[STSODataOnlineStore alloc] initWithURL:[NSURL URLWithString:kServiceRoot]];
            [(STSODataOnlineStore *)self.store setOnlineStoreDelegate:self.store]; // Set the storeDelegate. This will be called when the open finishes / fails.
           [(STSODataOnlineStore *)self.store setRequestCredentialsDelegate:self.store]; //This delegate will be called for the credentials
            
            self.store = [[SODataOnlineStore alloc] initWithURL:[NSURL URLWithString:kServiceRoot]];
            [(SODataOnlineStore *)self.store setOnlineStoreDelegate:self]; // Set the storeDelegate. This will be called when the open finishes / fails.
            [(SODataOnlineStore *)self.store setRequestCredentialsDelegate:self]; //This delegate will be called for the credentials
            [(SODataOnlineStore *)self.store openStoreWithError:&err];
            
        } else {
            // if set for offline, use an offline store
            self.store = (SODataOfflineStore *)[[SODataOfflineStore alloc] init];
            SODataOfflineStoreOptions *opts = [[SODataOfflineStoreOptions alloc] init];
            opts.serviceRoot = kServiceRoot;
            
        }
        if (err != nil) {
            NSLog(@"err = %@", [err localizedDescription]);
        }
        
        
        
        return self;
    }
    return nil;
}


// Fetch objects, using NSURLSession
/*
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
*/

// Fetch objects, using SODataOnlineStore

+ (RACReplaySubject *)fetchCarriers
{
    RACReplaySubject *subject = [RACReplaySubject subject];
    
    NSString *resourceString = @"CarrierCollection";
    
    [[Client sharedClient] scheduleRequestForResource:resourceString withMethod:@"GET" withCompletion:^(NSArray *entities) {
        
        if (entities) {
            [subject sendNext:[[[entities rac_sequence] map:^id(NSDictionary *value) {
                Carrier *model = [Carrier new];
                [Client configureCarrierModel:model withDictionary:value];
                
                return model;
            }] array]];
            [subject sendCompleted];
        } else {
            [subject sendError:nil];
        }
    }];
    return subject;
}

-(void)scheduleRequestForResource:(NSString *)resourcePath withMethod:(NSString *) method withCompletion:(void(^)(NSArray *array))completion
{
    //supported modes:  READ || GET, CREATE, UPDATE, PATCH, DELETE
    int mode = 0;
    if ([method isEqualToString:@"READ"] || [method isEqualToString:@"GET"]) {
        mode = 1;
    } else if ([method isEqualToString:@"CREATE"]) {
        mode = 2;
    } else if ([method isEqualToString:@"UPDATE"]) {
        mode = 3;
    } else if ([method isEqualToString:@"PATCH"]) {
        mode = 4;
    } else if ([method isEqualToString:@"DELETE"]) {
        mode = 5;
    } else {
        //die
        NSLog(@"Supported methods are: READ || GET, CREATE, UPDATE, PATCH, DELETE");
        abort();
    }
    
    SODataRequestParamSingleDefault *thisRequest = [[SODataRequestParamSingleDefault alloc] initWithMode:SODataRequestModeRead resourcePath:resourcePath];
    [thisRequest setResponseType:SODataTypeEntitySet name:resourcePath];
    
    [self.store scheduleRequest:thisRequest completionHandler:^(id<SODataEntitySet> entities, id<SODataRequestExecution> requestExecution, NSError *error) {
        if (!error) {
            if ([entities entities]) {
                completion([entities entities]);
            } else {
                completion(nil);
            }
        } else {
            NSLog(@"ALERT ERROR %@", error);
        }
    }];
}


/*
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
*/

@end
