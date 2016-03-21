//
//  CoreDataCompany.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-21.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CoreDataCarModel, CoreDataCategory;

@interface CoreDataCompany : NSManagedObject

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSNumber *haveCategories;

@property (strong, nonatomic) NSSet *models;
@property (strong, nonatomic) NSSet *categories;

@end

@interface CoreDataCompany (CoreDataGeneratedAccessors)

- (void)addCategoriesObject:(CoreDataCategory *)value;
- (void)removeCategoriesObject:(CoreDataCategory *)value;

- (void)addModelsObject:(CoreDataCarModel *)value;
- (void)removeModelsObject:(CoreDataCarModel *)value;

@end
