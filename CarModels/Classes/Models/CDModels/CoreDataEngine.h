//
//  CoreDataEngine.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-21.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface CoreDataEngine : NSManagedObject

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *acceleration;
@property (strong, nonatomic) NSString *caxs;
@property (strong, nonatomic) NSString *co2;
@property (strong, nonatomic) NSString *litr;
@property (strong, nonatomic) NSString *hoursePower;
@property (strong, nonatomic) NSString *maxSpeed;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *qarshak;
@property (strong, nonatomic) NSString *qash;
@property (strong, nonatomic) NSString *torque;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *valve;
@property (strong, nonatomic) NSString *rpm;
@property (strong, nonatomic) NSNumber *order;

- (void)configureWithData:(NSDictionary *)data;

@end
