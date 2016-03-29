//
//  CoreDataCompany.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-21.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CoreDataCompany.h"
//dao
#import "DAOCategory.h"
#import "DAOModel.h"
//model
#import "CoreDataCategory.h"
#import "CoreDataCarModel.h"

@implementation CoreDataCompany

@dynamic identifier;
@dynamic haveCategories;
@dynamic models;
@dynamic categories;
@dynamic awsBucketName;

- (void)configureWithData:(NSDictionary *)data {
    
    DAOCategory *daoCategory = [[DAOCategory alloc] init];
    
    self.haveCategories = [data objectForKey:@"haveCategories"];
    self.awsBucketName = [data objectForKey:@"aws_bucket"];
    
    if ([data objectForKey:@"categories"]) {
        
        NSArray *categories = [data objectForKey:@"categories"];
        for (NSDictionary *categoryData in categories) {
            
            CoreDataCategory *categoryCD = [daoCategory createOrUpdateCategoryData:categoryData];
            if(![self.categories containsObject:categoryCD]) {
               
                [self addCategoriesObject:categoryCD];
            }
        }
    } else {
        
        self.categories = nil;
    }
    
    DAOModel *daoModel = [[DAOModel alloc] init];
    if ([data objectForKey:@"models"]) {
        
        NSArray *models = [data objectForKey:@"models"];
        for (NSDictionary *modelData in models) {
            
            CoreDataCarModel *modelCD = [daoModel createOrUpdateCarModelData:modelData];
            if(![self.models containsObject:modelCD]) {
                
                [self addModelsObject:modelCD];
            }
        }
    } else {
        
        self.models = nil;
    }}

@end
