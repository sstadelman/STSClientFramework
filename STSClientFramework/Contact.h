//
//  Contact.h
//  Usage Prototype
//
//  Created by Stadelman, Stan on 3/28/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject
@property (nonatomic, strong) NSString *businessPartnerID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *emailAddress;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *postalCode;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *building;
@property (nonatomic, strong) NSString *country;

@end


/*
 __metadata: {
 uri: "https://sapes1.sapdevcenter.com:443/sap/opu/odata/sap/ZGWSAMPLE_SRV/ContactCollection(BusinessPartnerID='0100000002',Title='',FirstName='Maria',MiddleName='',LastName='Brown',PostalCode='19899',City='Wilmington%2C%20Delaware',Street='1%202345%20King%20Street',Building='1',Country='US',AddressType='02')"
 type: "ZGWSAMPLE_SRV.Contact"
 }-
 BusinessPartnerID: "0100000002"
 Title: ""
 FirstName: "Maria"
 MiddleName: ""
 LastName: "Brown"
 Nickname: ""
 Initials: ""
 Sex: "F"
 PhoneNumber: "3023352668"
 FaxNumber: ""
 EmailAddress: "maria.brown@delbont.com"
 Language: "E"
 PostalCode: "19899"
 City: "Wilmington, Delaware"
 Street: "1 2345 King Street"
 Building: "1"
 Country: "US"
 AddressType: "02"
 AddressValStartDate: "/Date(946713600000)/"
 AddressValEndDate: "/Date(253402243200000)/"
 */