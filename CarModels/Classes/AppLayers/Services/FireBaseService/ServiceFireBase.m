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

- (void)loadCategoryForModel:(ModelLogoInfo *)logoInfo {
    
    if (!logoInfo.identifier) {
        
        return;
    }
    
    NSString *appendingPath = [NSString stringWithFormat:@"%@/cars/%@", kFireBaseUrl, logoInfo.identifier];
    
    NSLog(@"path %@", appendingPath);
    Firebase *firebase = [[Firebase alloc] initWithUrl:appendingPath];

//    [self.fireBaseRoot childByAppendingPath:appendingPath];
    NSLog(@"fireBase %@", firebase);
    [firebase observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        
        NSLog(@"%@", snapshot.value);
        // do some stuff once
    }];
}

@end
