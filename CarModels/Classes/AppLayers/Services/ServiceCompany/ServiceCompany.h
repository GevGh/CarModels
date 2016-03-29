//
//  ServiceCompany.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-26.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CoreDataCompany;

@interface ServiceCompany : NSObject

- (CoreDataCompany *)getCompanyInfoWithID:(NSString *)identifier;
- (void)loadCompanyInfoWithId:(NSString *)identifier
                   completion:(void(^)(CoreDataCompany *company))completion;

@end
