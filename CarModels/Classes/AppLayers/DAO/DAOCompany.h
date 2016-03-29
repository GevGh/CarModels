//
//  DAOCompany.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-25.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CoreDataCompany;

@interface DAOCompany : NSObject

- (CoreDataCompany *)configureCompanyCategoriesWithData:(id )data companyId:(NSString *)identifier;
- (CoreDataCompany *)getCompanyWithId:(NSString *)companyID;

@end
