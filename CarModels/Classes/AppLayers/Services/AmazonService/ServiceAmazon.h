//
//  ServiceAmazon.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-21.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceAmazon : NSObject

+ (void)setupAmazonConfigurations;

- (void)downloadAWSPhotoWithBucketName:(NSString *)bucketName
                             imageName:(NSString *)imageName
                                toPath:(NSString *)downloadingFilePath
                            completion:(void(^)(NSError *error))completion;

@end
