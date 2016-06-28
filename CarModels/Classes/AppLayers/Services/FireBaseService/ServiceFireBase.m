//
//  ServiceFireBase.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-17.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "ServiceFireBase.h"
#import <Firebase/Firebase.h>
#import "ModelLogoInfo.h"

static NSString *const kFireBaseUrl = @"https://sizzling-fire-6856.firebaseio.com/";

@interface ServiceFireBase ()

@property (strong, nonatomic) Firebase *fireBaseRoot;

@end

@implementation ServiceFireBase

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (Firebase *)fireBaseRoot {
    
    if (_fireBaseRoot == nil) {
        
        _fireBaseRoot = [[Firebase alloc] initWithUrl:@"https://sizzling-fire-6856.firebaseio.com"];
    }
    return _fireBaseRoot;
}

- (void)loadCategoryForCompanyId:(NSString *)identifier withCompletion:(void(^)(id data))completion {
    
    if (!identifier) {
        
        completion(nil);
        return;
    }
    
    NSString *appendingPath = [NSString stringWithFormat:@"%@/cars/%@", kFireBaseUrl, identifier];
    
    NSLog(@"path %@", appendingPath);
    Firebase *firebase = [[Firebase alloc] initWithUrl:appendingPath];

    NSLog(@"fireBase %@", firebase);
    [firebase observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        
        completion(snapshot.value);
    }];
}

@end
