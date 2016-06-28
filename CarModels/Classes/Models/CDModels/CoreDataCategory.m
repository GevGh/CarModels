//
//  CoreDataCategory.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-21.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CoreDataCategory.h"
#import "DAOModel.h"
#import "CoreDataCarModel.h"

@implementation CoreDataCategory

@dynamic identifier;
@dynamic imageId;
@dynamic name;
@dynamic models;
@dynamic order;

- (void)configureWithData:(NSDictionary *)data {
    
    DAOModel *daoModel = [[DAOModel alloc] init];
    
    self.imageId = [data objectForKey:@"fakePhoto"];
    self.name = [data objectForKey:@"name"];
    self.order = [data objectForKey:@"order"];
    
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
    }
}

@end
