//
//  ServiceLogo.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-08.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModelLogoInfo;

@interface ServiceLogo : NSObject

- (NSArray <__kindof ModelLogoInfo*> *)getAllLogoModels;

@end
