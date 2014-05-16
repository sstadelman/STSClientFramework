//
//  Carrier.h
//  SMP3ODataAPI
//
//  Created by Stadelman, Stan on 5/13/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Carrier : NSObject


@property (nonatomic, strong) NSString *carrid;
@property (nonatomic, strong) NSString *CARRNAME;
@property (nonatomic, strong) NSString *CURRCODE;
@property (nonatomic, strong) NSString *URL;
@property (nonatomic, strong) NSString *mimeType;
@property (nonatomic, strong) NSDictionary *carrierFlights;


@end


/*
 <EntityType Name="Carrier" m:HasStream="true" sap:content-version="1">
 <Key>
 <PropertyRef Name="carrid"/>
 </Key>
 <Property Name="carrid" Type="Edm.String" Nullable="false" MaxLength="3" sap:label="Airline"/>
 <Property Name="CARRNAME" Type="Edm.String" MaxLength="20" sap:label="Airline"/>
 <Property Name="CURRCODE" Type="Edm.String" MaxLength="5" sap:label="Airline Currency" sap:semantics="currency-code"/>
 <Property Name="URL" Type="Edm.String" MaxLength="255" sap:label="URL"/>
 <Property Name="mimeType" Type="Edm.String" MaxLength="128" sap:label="MIME Type" sap:filterable="false"/>
 <NavigationProperty Name="carrierFlights" Relationship="RMTSAMPLEFLIGHT.CarrierToFlight" FromRole="FromRole_CarrierToFlight" ToRole="ToRole_CarrierToFlight"/>
 </EntityType>
 */