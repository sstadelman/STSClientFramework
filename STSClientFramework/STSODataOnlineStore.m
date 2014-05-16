//
//  myODataOnlineStore.m
//  SMP3ODataAPI
//
//  Created by Stadelman, Stan on 5/14/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import "STSODataOnlineStore.h"
#import "SODataResponse.h"
#import "SODataRequestExecution.h"
#import "SODataResponseSingle.h"
#import "SODataPayload.h"
#import "SODataUserCredentials.h"
#import "SODataRequestParamSingleDefault.h"

@interface STSODataOnlineStore() <SODataRequestDelegate, SODataRequestCredentialsDelegate>{
    
}

@end
@implementation STSODataOnlineStore


- (void) scheduleRequest:(id<SODataRequestParam>)request completionHandler:(void(^)(id<SODataEntitySet>entities, id<SODataRequestExecution>requestExecution, NSError *error))completion
{
    NSString *finishedSubscription = [NSString stringWithFormat:@"com.sap.odata.store.request.finished.%@", [request description]];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:finishedSubscription object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        
        // this code will handle the <requestExecution> response, and call the completion block.
        id<SODataRequestExecution>requestExecution = note.object;
        
        id<SODataResponse> response = requestExecution.response;
        
        if (response.isBatch)
        {
            // need to understand what this code would look like
        }
        else // not a batch response, only one response to handle
        {
            id<SODataResponseSingle> respSingle = (id<SODataResponseSingle>) response;
            // extract the payload
            id<SODataPayload> p = respSingle.payload;
            
            // if payload is an error, construct the error
            if ([respSingle payloadType] == SODataTypeError)
            {
                NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
                [errorDetail setValue:@"Error querying data" forKey:NSLocalizedDescriptionKey];
                NSError *error = [NSError errorWithDomain:@"myDomain" code:100 userInfo:errorDetail];
                
                // call the completion block with error and requestExecution
                completion(nil, requestExecution, error);
            }
            // response is an entity set
            else if ([respSingle payloadType] == SODataTypeEntitySet)
            {
                // copy and cast the entities from the response payload
                id<SODataEntitySet> entities = (id<SODataEntitySet>)p;
                
                // call completion block, with entities, requestExecution, and no error
                completion(entities, requestExecution, nil);
            }
            else // payload is undefined type, construct error
            {
                NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
                [errorDetail setValue:@"Unexpected payload type" forKey:NSLocalizedDescriptionKey];
                NSError *error = [NSError errorWithDomain:@"myDomain" code:100 userInfo:errorDetail];

                // call the completion block with error and requestExecution
                completion(nil, requestExecution, error);
                return;
            }
        }

        
    }];
    // then, the original SODataAsynch API is called
    
    id<SODataRequestExecution> rEx = [self scheduleRequest:request delegate:self];
    
    NSLog(@"Schedule request executed");

}


#pragma mark - SODataRequestDelegate

- (void) requestServerResponse:(id<SODataRequestExecution>)requestExecution
{
    NSLog(@"Server response");
}

- (void) requestStarted:(id<SODataRequestExecution>)requestExecution
{
    NSLog(@"Server started");
}

- (void) requestCacheResponse:(id<SODataRequestExecution>)requestExecution
{
    NSLog(@"Server cache response");
}

- (void) requestFinished:(id<SODataRequestExecution>)requestExecution
{
    NSLog(@"Request completed");
    
    // build notification tag for this request
    NSString *finishedSubscription = [NSString stringWithFormat:@"com.sap.odata.store.request.finished.%@", [requestExecution.request description]];
    
    // send notification for the finished request
    [[NSNotificationCenter defaultCenter] postNotificationName:finishedSubscription object:requestExecution];
    

}

#pragma mark SODataRequestCredentialsDelegate
- (id<SODataCredentials>)credentialsForRequest
{
    SODataUserCredentials* cred = [[SODataUserCredentials alloc] init];  //Create a credentials object and fill with logon data.
    cred.userName = @"i826181";
    cred.password = @"Initial123";
    return cred;
}

@end
