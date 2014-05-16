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

//Business Partner Model
+(void)configureBusinessPartnerModel:(BusinessPartner *)model withDictionary:(NSDictionary *)dictionary;
+(void)configureSalesOrderModel:(SalesOrder *)model withDictionary:(NSDictionary *)dictionary;
+(void)configureContactModel:(Contact *)model withDictionary:(NSDictionary *)dictionary;
+(void)configureLineItemModel:(LineItem *)model withDictionary:(NSDictionary *)dictionary;

//Flights Model
+(void)configureCarrierModel:(Carrier *)model withDictionary:(NSDictionary *)dictionary;
+(void)configureFlightModel:(Flight *)model withDictionary:(NSDictionary *)dictionary;
+(void)configureFlightDetailsModel:(FlightDetails *)model withDictionary:(NSDictionary *)dictionary;

@end
