//
//  CoreDataCarModel.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-21.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CoreDataEngine;

@interface CoreDataCarModel : NSManagedObject

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSArray *imageIds;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *transsmisions;
@property (strong, nonatomic) NSString *yearBegan;
@property (strong, nonatomic) NSString *yearEnd;
@property (strong, nonatomic) NSNumber *order;

@property (strong, nonatomic) NSSet *engines;

- (void)configureWithData:(NSDictionary *)data;

@end

@interface CoreDataCarModel (CoreDataGeneratedAccessors)

- (void)addEnginesObject:(CoreDataEngine *)value;
- (void)removeEnginesObject:(CoreDataEngine *)value;

@end