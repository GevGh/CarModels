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
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *transsmisionType;
@property (strong, nonatomic) NSString *yearBegan;
@property (strong, nonatomic) NSString *yearEnd;

@property (strong, nonatomic) NSSet *engines;

@end

@interface CoreDataCarModel (CoreDataGeneratedAccessors)

- (void)addEnginesObject:(CoreDataEngine *)value;
- (void)removeEnginesObject:(CoreDataEngine *)value;

@end