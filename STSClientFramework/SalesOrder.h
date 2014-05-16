//
//  SalesOrder.h
//  Usage Prototype
//
//  Created by Stadelman, Stan on 3/28/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SalesOrder : NSObject

@property (nonatomic, strong) NSString *deliveryStatus;
@property (nonatomic, strong) NSString *billingStatus;
@property (nonatomic, strong) NSString *lifecycleStatus;
@property (nonatomic, strong) NSString *taxAmountExt;
@property (nonatomic, strong) NSString *taxAmount;
@property (nonatomic, strong) NSString *netAmountExt;
@property (nonatomic, strong) NSString *netAmount;
@property (nonatomic, strong) NSString *grossAmountExt;
@property (nonatomic, strong) NSString *grossAmount;
@property (nonatomic, strong) NSString *currencyCode;
@property (nonatomic, strong) NSString *buyerName;
@property (nonatomic, strong) NSString *buyerId;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSString *soId;
@property (nonatomic, strong) NSString *createdBy;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSDictionary *lineItems;

@end

/*
https://sapes1.sapdevcenter.com:443/sap/opu/odata/sap/ZGWSAMPLE_SRV/BusinessPartnerCollection('0100000003')/SalesOrders
{
d: {
results: [1]
    0:  {
    __metadata: {
    uri: "https://sapes1.sapdevcenter.com:443/sap/opu/odata/sap/ZGWSAMPLE_SRV/SalesOrderCollection('0500000006')"
    type: "ZGWSAMPLE_SRV.SalesOrder"
    }-
    DeliveryStatus: ""
    BillingStatus: ""
    LifecycleStatus: "N"
    TaxAmountExt: "40.0300"
    TaxAmount: "40.03"
    NetAmountExt: "210.7000"
    NetAmount: "210.7"
    GrossAmountExt: "250.7300"
    GrossAmount: "250.73"
    CurrencyCode: "EUR"
    BuyerName: "Talpa"
    BuyerId: "0100000003"
    Note: "EPM DG: SO ID 0500000006 Deliver as fast as possible"
    SoId: "0500000006"
    CreatedBy: "0000000033"
    ChangedByBp: false
    CreatedAt: "/Date(1395993600000)/"
    ChangedBy: "0000000033"
    ChangedAt: "/Date(1395993600000)/"
    CreatedByBp: false
    BusinessPartner: {
    __deferred: {
    uri: "https://sapes1.sapdevcenter.com:443/sap/opu/odata/sap/ZGWSAMPLE_SRV/SalesOrderCollection('0500000006')/BusinessPartner"
    }-
    }-
    LineItems: {
    __deferred: {
    uri: "https://sapes1.sapdevcenter.com:443/sap/opu/odata/sap/ZGWSAMPLE_SRV/SalesOrderCollection('0500000006')/LineItems"
    }-
    }-
    }-
    -
}-
}
*/