//
//  FlightDetails.h
//  SMP3ODataAPI
//
//  Created by Stadelman, Stan on 5/13/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlightDetails : NSObject

@property (nonatomic, strong) NSString *countryFrom;
@property (nonatomic, strong) NSString *cityFrom;
@property (nonatomic, strong) NSString *airportFrom;
@property (nonatomic, strong) NSString *countryTo;
@property (nonatomic, strong) NSString *airportTo;
@property (nonatomic, strong) NSNumber *flightTime;
@property (nonatomic, strong) NSString *departureTime;
@property (nonatomic, strong) NSString *arrivalTime;
@property (nonatomic, strong) NSNumber *distance;
@property (nonatomic, strong) NSNumber *distanceUnit;
@property (nonatomic, strong) NSNumber *flightType;
@property (nonatomic, strong) NSNumber *period;

@end



/*
 <ComplexType Name="FlightDetails" gp:display-order="0010">
 <Property Name="countryFrom" Type="Edm.String" MaxLength="3" sap:label="Country"/>
 <Property Name="cityFrom" Type="Edm.String" MaxLength="20" sap:label="Depart.city"/>
 <Property Name="airportFrom" Type="Edm.String" MaxLength="3" sap:label="Dep. airport"/>
 <Property Name="countryTo" Type="Edm.String" MaxLength="3" sap:label="Country"/>
 <Property Name="cityTo" Type="Edm.String" MaxLength="20" sap:label="Arrival city"/>
 <Property Name="airportTo" Type="Edm.String" MaxLength="3" sap:label="Dest. airport"/>
 <Property Name="flightTime" Type="Edm.Int32" sap:label="Flight time"/>
 <Property Name="departureTime" Type="Edm.Time" sap:label="Departure"/>
 <Property Name="arrivalTime" Type="Edm.Time" sap:label="Arrival Time"/>
 <Property Name="distance" Type="Edm.Decimal" Precision="9" Scale="4" sap:unit="distanceUnit" sap:label="Distance"/>
 <Property Name="distanceUnit" Type="Edm.String" MaxLength="3" sap:label="Distance in" sap:semantics="unit-of-measure"/>
 <Property Name="flightType" Type="Edm.String" MaxLength="1" sap:label="Charter"/>
 <Property Name="period" Type="Edm.Byte" sap:label="n day(s) later"/>
 </ComplexType>
 */