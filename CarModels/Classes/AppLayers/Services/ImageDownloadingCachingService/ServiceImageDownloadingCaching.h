//
//  ServiceImageDownloadingCaching.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-21.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface ServiceImageDownloadingCaching : NSObject

+ (instancetype)sharedInstance;

- (void)cancelDownloadinRequestForKey:(NSString *)key;

- (void)getLogoBackgroungImageWithId:(NSString *)imageId
                          completion:(void(^)(UIImage *image))completion;

- (void)getImageForBucket:(NSString *)bucket
                  imageID:(NSString *)imageID
               completion:(void(^)(UIImage *image))completion;

@end
