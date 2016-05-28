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
@dynamic consumption;
@dynamic co2;
@dynamic capacity;
@dynamic hoursePower;
@dynamic maxSpeed;
@dynamic name;
@dynamic qarshak;
@dynamic torque;
@dynamic type;
@dynamic valvesPerCilinder;
@dynamic rpm;
@dynamic order;
@dynamic fuelTank;
@dynamic cilinder;

- (void)configureWithData:(NSDictionary *)data {
    
    
//        "id": "60465-ixhpG",
    
    
    
    self.co2                = [data objectForKey:@"CO2"];
    self.valvesPerCilinder  = [data objectForKey:@"valves_per_cylinder"];
    self.type               = [data objectForKey:@"type"];
    self.torque             = [data objectForKey:@"torque"];
    self.qarshak            = [data objectForKey:@"rwd"];
    self.name               = [data objectForKey:@"name"];
    self.maxSpeed           = [data objectForKey:@"max_speed"];
    self.capacity           = [data objectForKey:@"capacity"];
    self.hoursePower        = [data objectForKey:@"hourspower"];
    self.consumption        = [data objectForKey:@"consumption"];
    self.acceleration       = [data objectForKey:@"acceleration"];
    self.rpm                = [data objectForKey:@"max_power_rpm"];
    self.order              = [data objectForKey:@"order"];
    self.cilinder           = [data objectForKey:@"cilinder"];
    self.fuelTank           = [data objectForKey:@"fuel_tank"];
}

@end
