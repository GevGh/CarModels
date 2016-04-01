//
//  CoreDataCategory.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-21.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CoreDataCarModel;

@interface CoreDataCategory : NSManagedObject

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *imageId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *order;

@property (strong, nonatomic) NSSet *models;

- (void)configureWithData:(NSDictionary *)data;

@end

@interface CoreDataCategory (CoreDataGeneratedAccessors)

- (void)addModelsObject:(CoreDataCarModel *)value;
- (void)removeModelsObject:(CoreDataCarModel *)value;

@end