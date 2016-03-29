//
//  ServiceFireBase.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-17.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModelLogoInfo;

@interface ServiceFireBase : NSObject

- (void)loadCategoryForCompanyId:(NSString *)identifier withCompletion:(void(^)(id data))completion;

@end
