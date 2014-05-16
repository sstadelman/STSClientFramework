//
//  LineItem.h
//  Usage Prototype
//
//  Created by Stadelman, Stan on 3/31/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LineItem : NSObject
@property (nonatomic, strong) NSString *grossAmount;
@property (nonatomic, strong) NSString *currencyCode;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *soItemPos;
@property (nonatomic, strong) NSString *soId;
@property (nonatomic, strong) NSString *netAmount;
@property (nonatomic, strong) NSString *taxAmount;
@property (nonatomic, strong) NSString *deliveryDate;
@property (nonatomic, strong) NSString *quantity;
@property (nonatomic, strong) NSString *quantityUnit;
@property (nonatomic, strong) NSDictionary *product;
@end

/*
GrossAmount: "168.74"
CurrencyCode: "ARS"
Note: "EPM DG: SO ID 0500000040 Item 0000000010"
ProductId: "HT-1070"
SoItemPos: "0000000010"
SoId: "0500000040"
GrossAmountExt: "168.7400"
NetAmount: "141.8"
NetAmountExt: "141.8000"
TaxAmount: "26.94"
TaxAmountExt: "26.9400"
DeliveryDate: "/Date(1396598400000)/"
Quantity: "2.000"
QuantityUnit: "EA"
Product: {
__deferred: {
uri: "https://sapes1.sapdevcenter.com:443/sap/opu/odata/sap/ZGWSAMPLE_SRV/SalesOrderLineItemCollection(SoItemPos='0000000010',SoId='0500000040')/Product"
}-
}
*/