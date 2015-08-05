//
//  CDRegisteredVehInfo.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/26/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//


#import "CDRegisteredVehInfo.h"
#import "CDVehicleConstants.h"

@implementation CDRegisteredVehInfo

@synthesize vehicleBrandName;
@synthesize vehicleModelName;
@synthesize vehicleModelId;
@synthesize vehicleRegNo;
@synthesize vehicleServiceDue;
@synthesize vehicleImage;
@synthesize vehicleImageName;

- (id)init
{
    if(self = [super init])
    {
        vehicleBrandName    = [NSString string];
        vehicleModelName    = [NSString string];
        vehicleModelId      = [NSString string];
        vehicleRegNo        = [NSString string];
        vehicleImageName    = [NSString string];
        vehicleServiceDue   = [NSDate date];
    }
    return self;
}


- (id)initWithJsonDict:(NSMutableDictionary *)dict
{
    if (dict == nil)
    {
        return nil;
    }
    
    
    if ((self = [super init]))
    {
        self.vehicleBrandName    = [dict objectForKey:VEHICLE_BRAND_NAME];
        self.vehicleModelName    = [dict objectForKey:VEHICLE_MODEL_NAME];
        self.vehicleModelId      = [dict objectForKey:VEHICLE_MODEL_ID];
        self.vehicleRegNo        = [dict objectForKey:VEHICLE_REG_NO];
        self.vehicleServiceDue   = [dict objectForKey:VEHICLE_SERVICE_DUE];
        self.vehicleImageName    = [dict objectForKey:VEHICLE_IMAGE_NAME];
        
//        id parsedValue = nil;
//        /* Account */
//        parsedValue = [dict objectForKey:ACCOUNT];
//        if (parsedValue && [parsedValue isKindOfClass:[NSDictionary class]] && [parsedValue count] > 0)
//        {
//            self.bic=[(NSDictionary *)parsedValue objectForKey:BIC];
//            self.creationDate=[(NSDictionary *)parsedValue objectForKey:CREATIONDATE];
//            self.firstName=[(NSDictionary *)parsedValue objectForKey:FIRSTNAME];
//            self.lastName=[(NSDictionary *)parsedValue objectForKey:LASTNAME];
//            self.language=[(NSDictionary *)parsedValue objectForKey:LANGUAGE];
//            self.phoneNumber=[(NSDictionary *)parsedValue objectForKey:PHONENUMBER];
//            self.iBan=[(NSDictionary *)parsedValue objectForKey:IBAN];
//            self.suspended=[((NSNumber *)[(NSDictionary *)parsedValue objectForKey:SUSPENDED]) boolValue];
//        }
//        else
//        {
//            DLog(@"Check validity failed on field : CONTEXT_LIST for : %@",parsedValue);
//            return nil;
//        }
    }
    return self;
}

@end
