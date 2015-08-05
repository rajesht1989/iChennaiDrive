//
//  CDRegisteredVehInfo.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/26/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CDRegisteredVehInfo : NSObject
{
//    NSString *vehicleBrandName;
//    NSString *vehicleModelName;
//    NSString *vehicleModelId;
//    NSString *vehicleRegNo;
//    NSDate   *vehicleServiceDue;
//    UIImage  *vehicleImage;
}
/**************************************************************************************************/
#pragma mark - Birth and Death

- (id)initWithJsonDict:(NSMutableDictionary *)dict;
- (id)init;
/**************************************************************************************************/
#pragma mark - Getters & Setters

@property(weak,nonatomic) NSString *vehicleBrandName;
@property(weak,nonatomic) NSString *vehicleModelName;
@property(weak,nonatomic) NSString *vehicleModelId;
@property(weak,nonatomic) NSString *vehicleRegNo;
@property(weak,nonatomic) NSDate   *vehicleServiceDue;
@property(weak,nonatomic) UIImage  *vehicleImage;
@property(weak,nonatomic) NSString *vehicleImageName;
@end
