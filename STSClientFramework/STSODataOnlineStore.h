//
//  myODataOnlineStore.h
//  SMP3ODataAPI
//
//  Created by Stadelman, Stan on 5/14/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import "SODataOnlineStore.h"

@interface STSODataOnlineStore : SODataOnlineStore <SODataStore, SODataStoreSync, SODataStoreAsync>

- (void) scheduleRequest:(id<SODataRequestParam>)request completionHandler:(void(^)(id<SODataEntitySet>entities, id<SODataRequestExecution>requestExecution, NSError *error))completion;

@end
