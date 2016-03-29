//
//  ServiceCompany.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-26.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "ServiceCompany.h"
#import "ServiceFireBase.h"
#import "DAOCompany.h"

@interface ServiceCompany ()

@property (strong, nonatomic) ServiceFireBase *serviceFireBase;
@property (strong, nonatomic) DAOCompany *daoCompany;

@end

@implementation ServiceCompany

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _serviceFireBase = [[ServiceFireBase alloc] init];
        _daoCompany = [[DAOCompany alloc] init];
    }
    return self;
}

- (CoreDataCompany *)getCompanyInfoWithID:(NSString *)identifier {
    
    return [self.daoCompany getCompanyWithId:identifier];
}

- (void)loadCompanyInfoWithId:(NSString *)identifier
                   completion:(void(^)(CoreDataCompany *company))completion {
    
    NSDate *methodStart = [NSDate date];
    
    
    [self.serviceFireBase loadCategoryForCompanyId:identifier
                                    withCompletion:^(id data) {
                                        
                                        /* ... Do whatever you need to do ... */
                                        
                                        NSDate *methodFinish = [NSDate date];
                                        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
                                        NSLog(@"executionTime = %f", executionTime);
                                       
                                        CoreDataCompany *company = [self.daoCompany configureCompanyCategoriesWithData:data companyId:identifier];
                                        
                                        NSDate *methodFinish2 = [NSDate date];
                                        NSTimeInterval executionTime2 = [methodFinish2 timeIntervalSinceDate:methodFinish];
                                        NSLog(@"executionTime = %f", executionTime2);
                                        
                                        completion(company);
                                    }];
}

@end
