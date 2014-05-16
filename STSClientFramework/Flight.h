//
//  Flight.h
//  SMP3ODataAPI
//
//  Created by Stadelman, Stan on 5/13/14.
//  Copyright (c) 2014 Jobson, Chris. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FlightDetails;

@interface Flight : NSObject

@property (nonatomic, strong) NSString *carrid;
@property (nonatomic, strong) NSString *connid;
@property (nonatomic, strong) NSString *fldate;
@property (nonatomic, strong) FlightDetails *flightDetails;
@property (nonatomic, strong) NSNumber *PRICE;
@property (nonatomic, strong) NSString *CURRENCY;
@property (nonatomic, strong) NSString *PLANETYPE;
@property (nonatomic, strong) NSNumber *SEATSMAX;
@property (nonatomic, strong) NSNumber *SEATSOCC;
@property (nonatomic, strong) NSNumber *PAYMENTSUM;
@property (nonatomic, strong) NSNumber *SEATSMAX_B;
@property (nonatomic, strong) NSNumber *SEATSOCC_B;
@property (nonatomic, strong) NSNumber *SEATSMAX_F;
@property (nonatomic, strong) NSNumber *SEATSOCC_F;
@property (nonatomic, strong) NSString *flightbooking;
@property (nonatomic, strong) NSString *flightBookings;
@property (nonatomic, strong) NSString *FlightCarrier;


@end


/*
 <EntityType Name="Flight" sap:content-version="1">
 <Key>
 <PropertyRef Name="carrid"/>
 <PropertyRef Name="connid"/>
 <PropertyRef Name="fldate"/>
 </Key>
 <Property Name="flightDetails" Type="RMTSAMPLEFLIGHT.FlightDetails" Nullable="false"/>
 <Property Name="carrid" Type="Edm.String" Nullable="false" MaxLength="3" sap:label="Airline"/>
 <Property Name="connid" Type="Edm.String" Nullable="false" MaxLength="4" sap:label="Flight Number"/>
 <Property Name="fldate" Type="Edm.DateTime" Nullable="false" sap:label="Date"/>
 <Property Name="PRICE" Type="Edm.Decimal" Precision="15" Scale="2" sap:unit="CURRENCY" sap:label="Airfare"/>
 <Property Name="CURRENCY" Type="Edm.String" MaxLength="5" sap:label="Airline Currency" sap:sortable="false" sap:semantics="currency-code"/>
 <Property Name="PLANETYPE" Type="Edm.String" MaxLength="10" sap:label="Type of the plane"/>
 <Property Name="SEATSMAX" Type="Edm.Int32" sap:label="Max. capacity econ."/>
 <Property Name="SEATSOCC" Type="Edm.Int32" sap:label="Occupied econ."/>
 <Property Name="PAYMENTSUM" Type="Edm.Decimal" Precision="17" Scale="2" sap:label="Total"/>
 <Property Name="SEATSMAX_B" Type="Edm.Int32" sap:label="Max. capacity bus."/>
 <Property Name="SEATSOCC_B" Type="Edm.Int32" sap:label="Occupied bus."/>
 <Property Name="SEATSMAX_F" Type="Edm.Int32" sap:label="Max. capacity 1st"/>
 <Property Name="SEATSOCC_F" Type="Edm.Int32" sap:label="Occupied 1st"/>
 <NavigationProperty Name="flightbooking" Relationship="RMTSAMPLEFLIGHT.BookingFlight" FromRole="FromRole_BookingFlight" ToRole="ToRole_BookingFlight"/>
 <NavigationProperty Name="flightBookings" Relationship="RMTSAMPLEFLIGHT.FlightBookings" FromRole="FromRole_FlightBookings" ToRole="ToRole_FlightBookings"/>
 <NavigationProperty Name="FlightCarrier" Relationship="RMTSAMPLEFLIGHT.CarrierToFlight" FromRole="ToRole_CarrierToFlight" ToRole="FromRole_CarrierToFlight"/>
 </EntityType>
 */