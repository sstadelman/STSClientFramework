//
//  Client+ConfigureModels.m
//  STSClientFramework
//
//  Created by Stadelman, Stan on 5/16/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//


#import "Client+ConfigureModels.h"

#import "MyObject.h"

//EPM
#import "BusinessPartner.h"
#import "SalesOrder.h"
#import "Contact.h"
#import "LineItem.h"

//Flights
#import "Carrier.h"
#import "Flight.h"
#import "FlightDetails.h"

@implementation Client (ConfigureModels)

#pragma mark Model Configuration

+(void)configureObjectModel:(MyObject *)model withDictionary:(NSDictionary *)dictionary
{

    model.myProperty = dictionary[@"myProperty"];

}

#pragma mark EPM Application
+(void)configureBusinessPartnerModel:(BusinessPartner *)model withDictionary:(NSDictionary *)dictionary
{
    model.businessPartnerId = dictionary[@"BusinessPartnerID"];
    model.bpRole = dictionary[@"BpRole"];
    model.emailAddress = dictionary[@"EmailAddress"];
    model.phoneNumber = dictionary[@"PhoneNumber"];
    model.webAddress = dictionary[@"WebAddress"];
    model.companyName = dictionary[@"CompanyName"];
    model.legalForm = dictionary[@"LegalForm"];
    model.currencyCode = dictionary[@"CurrencyCode"];
    model.city = dictionary[@"City"];
    model.postalCode = dictionary[@"PostalCode"];
    model.street = dictionary[@"Street"];
    model.building = dictionary[@"Building"];
    model.country = dictionary[@"Country"];
    model.salesOrders = dictionary[@"SalesOrders"];
    model.contacts = dictionary[@"Contacts"];
    
}

+(void)configureSalesOrderModel:(SalesOrder *)model withDictionary:(NSDictionary *)dictionary
{
    model.deliveryStatus = dictionary[@"DeliveryStatus"];
    model.billingStatus = dictionary[@"BillingStatus"];
    model.lifecycleStatus = dictionary[@"LifecycleStatus"];
    model.taxAmountExt = dictionary[@"TaxAmountExt"];
    model.taxAmount = dictionary[@"TaxAmount"];
    model.netAmountExt = dictionary[@"NetAmountExt"];
    model.netAmount = dictionary[@"NetAmount"];
    model.grossAmountExt = dictionary[@"GrossAmountExt"];
    model.grossAmount = dictionary[@"GrossAmount"];
    model.currencyCode = dictionary[@"CurrencyCode"];
    model.buyerName = dictionary[@"BuyerName"];
    model.buyerId = dictionary[@"BuyerId"];
    model.note = dictionary[@"Note"];
    model.soId = dictionary[@"SoId"];
    model.createdBy = dictionary[@"CreatedBy"];
    model.createdAt = dictionary[@"CreatedAt"];
    model.lineItems = dictionary[@"LineItems"];
    
}

+(void)configureContactModel:(Contact *)model withDictionary:(NSDictionary *)dictionary
{
    model.businessPartnerID = dictionary[@"BusinessPartnerID"];
    model.title = dictionary[@"Title"];
    model.firstName = dictionary[@"FirstName"];
    model.lastName = dictionary[@"LastName"];
    model.phoneNumber = dictionary[@"PhoneNumber"];
    model.emailAddress = dictionary[@"EmailAddress"];
    model.language = dictionary[@"Language: "];
    model.postalCode = dictionary[@"PostalCode"];
    model.city = dictionary[@"City:"];
    model.street = dictionary[@"Street"];
    model.building = dictionary[@"Building"];
    model.country = dictionary[@"Country"];
    
}

+(void)configureLineItemModel:(LineItem *)model withDictionary:(NSDictionary *)dictionary
{
    model.grossAmount = dictionary[@"GrossAmount"];
    model.currencyCode = dictionary[@"CurrencyCode"];
    model.note = dictionary[@"Note"];
    model.productId = dictionary[@"ProductId"];
    model.soItemPos = dictionary[@"SoItemPos"];
    model.soId = dictionary[@"SoId"];
    model.grossAmount = dictionary[@"GrossAmountExt"];
    model.netAmount = dictionary[@"NetAmount"];
    model.taxAmount = dictionary[@"TaxAmount"];
    model.deliveryDate = dictionary[@"DeliveryDate"];
    model.quantity = dictionary[@"Quantity"];
    model.quantityUnit = dictionary[@"QuantityUnit"];
    model.product = dictionary[@"Product"];
    
}

#pragma mark Flights Application
+(void)configureCarrierModel:(Carrier *)model withDictionary:(NSDictionary *)dictionary
{
    model.carrid = dictionary[@"carrid"];
    model.CARRNAME = dictionary[@"CARRNAME"];
    model.CURRCODE = dictionary[@"CURRCODE"];
    model.URL = dictionary[@"URL"];
    model.mimeType = dictionary[@"SoItemPos"];
    model.carrierFlights = dictionary[@"carrierFlights"];
}

+(void)configureFlightModel:(Flight *)model withDictionary:(NSDictionary *)dictionary
{
    model.carrid = dictionary[@"carrid"];
    model.connid = dictionary[@"connid"];
    model.fldate = dictionary[@"fldate"];
    
    FlightDetails *detailsModel = [FlightDetails new];
    [Client configureFlightDetailsModel:detailsModel withDictionary:dictionary[@"flightDetails"]];
    
    model.flightDetails = detailsModel;
    model.PRICE = dictionary[@"PRICE"];
    model.CURRENCY = dictionary[@"CURRENCY"];
    model.PLANETYPE = dictionary[@"PLANETYPE"];
    model.SEATSMAX = dictionary[@"SEATSMAX"];
    model.SEATSOCC = dictionary[@"SEATSOCC"];
    model.PAYMENTSUM = dictionary[@"PAYMENTSUM"];
    model.SEATSMAX_B = dictionary[@"SEATSMAX_B"];
    model.SEATSOCC_B = dictionary[@"SEATSOCC_B"];
    model.SEATSMAX_F = dictionary[@"SEATSMAX_F"];
    model.SEATSOCC_F = dictionary[@"SEATSOCC_F"];
    model.flightbooking = dictionary[@"flightbooking"];
    model.flightBookings = dictionary[@"flightBookings"];
    model.FlightCarrier = dictionary[@"FlightCarrier"];
}

+(void)configureFlightDetailsModel:(FlightDetails *)model withDictionary:(NSDictionary *)dictionary
{
    model.countryFrom = dictionary[@"countryFrom"];
    model.cityFrom = dictionary[@"cityFrom"];
    model.airportFrom = dictionary[@"airportFrom"];
    model.countryTo = dictionary[@"countryTo"];
    model.airportTo = dictionary[@"airportTo"];
    model.flightTime = dictionary[@"flightTime"];
    model.departureTime = dictionary[@"departureTime"];
    model.arrivalTime = dictionary[@"arrivalTime"];
    model.distance = dictionary[@"distance"];
    model.distanceUnit = dictionary[@"distanceUnit"];
    model.flightType = dictionary[@"flightType"];
    model.period = dictionary[@"period"];
    
}


@end
