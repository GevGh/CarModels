//
//  CoreDataEngine.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-21.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CoreDataEngine.h"

@implementation CoreDataEngine

@dynamic identifier;
@dynamic acceleration;
@dynamic caxs;
@dynamic co2;
@dynamic litr;
@dynamic hoursePower;
@dynamic maxSpeed;
@dynamic name;
@dynamic qarshak;
@dynamic qash;
@dynamic torque;
@dynamic type;
@dynamic valve;
@dynamic rpm;
@dynamic order;

- (void)configureWithData:(NSDictionary *)data {
    
    self.co2 = [data objectForKey:@"CO2"];
    self.valve = [data objectForKey:@"valve"];
    self.type = [data objectForKey:@"type"];
    self.torque = [data objectForKey:@"torque"];
    self.qash = [data objectForKey:@"qash"];
    self.qarshak = [data objectForKey:@"rwd"];
    self.name = [data objectForKey:@"name"];
    self.maxSpeed = [data objectForKey:@"max_speed"];
    self.litr = [data objectForKey:@"litr"];
    self.hoursePower = [data objectForKey:@"hourspower"];
    self.caxs = [data objectForKey:@"caxs"];
    self.acceleration = [data objectForKey:@"acceleration"];
    self.rpm = [data objectForKey:@"rpm"];
    self.qarshak = [data objectForKey:@"qarshak"];
    self.order = [data objectForKey:@"order"];
    self.cilinder = [data objectForKey:@"cilinder"];
}

@end
