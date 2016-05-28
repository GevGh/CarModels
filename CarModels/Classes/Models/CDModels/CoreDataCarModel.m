//
//  CoreDataCarModel.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-21.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CoreDataCarModel.h"
#import "CoreDataEngine.h"
#import "DAOEngine.h"

@implementation CoreDataCarModel

@dynamic identifier;
@dynamic imageIds;
@dynamic name;
@dynamic transsmisions;
@dynamic production;
@dynamic engines;
@dynamic order;

- (void)configureWithData:(NSDictionary *)data {
    
    self.name = [data objectForKey:@"name"];
    self.imageIds = [data objectForKey:@"images"];
    self.production = [data objectForKey:@"production"];
    self.order = [data objectForKey:@"order"];
    self.transsmisions = [data objectForKey:@"transsmision_type"];
    
    DAOEngine *daoEngine = [[DAOEngine alloc] init];
    if ([data objectForKey:@"engines"]) {
        
        NSArray *engines = [data objectForKey:@"engines"];
        for (NSDictionary *engineData in engines) {
            
            CoreDataEngine *engineCD = [daoEngine createOrUpdateEngineData:engineData];
            if(![self.engines containsObject:engineCD]) {
                
                [self addEnginesObject:engineCD];
            }
        }
    } else {
        
        self.engines = nil;
    }
}

@end
