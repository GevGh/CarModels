//
//  DAOModel.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-25.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CoreDataCarModel;

@interface DAOModel : NSObject

- (CoreDataCarModel *)createOrUpdateCarModelData:(NSDictionary *)data;

@end
