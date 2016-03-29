//
//  DAOCategory.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-25.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CoreDataCategory;

@interface DAOCategory : NSObject

- (CoreDataCategory *)createOrUpdateCategoryData:(NSDictionary *)data;

@end
