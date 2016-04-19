//
//  ModelLogoInfo.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-08.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelLogoInfo : NSObject

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *logoName;
@property (strong, nonatomic) NSString *backgroundImageURL;
@property (nonatomic) BOOL haveCategories;

@end
