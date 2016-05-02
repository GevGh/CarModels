//
//  AdLogicService.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-04-30.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdLogicService : NSObject

+ (instancetype)sharedInstance;

- (void)openedPoint:(NSInteger )point;

@end
