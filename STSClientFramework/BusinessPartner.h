//
//  BusinessPartner.h
//  Usage Prototype
//
//  Created by Stadelman, Stan on 3/13/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusinessPartner : NSObject

@property (nonatomic, strong) NSString *businessPartnerId;
@property (nonatomic, strong) NSString *bpRole;
@property (nonatomic, strong) NSString *emailAddress;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *webAddress;
@property (nonatomic, strong) NSString *companyName;
@property (nonatomic, strong) NSString *legalForm;
@property (nonatomic, strong) NSString *currencyCode;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *postalCode;
@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *building;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSDictionary *salesOrders;
@property (nonatomic, strong) NSDictionary *contacts;

@end
