//
//  ServiceImageDownloadingCaching.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-21.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "ServiceImageDownloadingCaching.h"
#import "ServiceAmazon.h"
#import "Constant.h"
#import <UIKit/UIKit.h>

@interface ServiceImageDownloadingCaching ()

@property (strong, nonatomic) ServiceAmazon *serviceAmazon;

@end

@implementation ServiceImageDownloadingCaching

static NSMutableSet *downloadingProcces;

- (NSMutableSet *)downloadingProcces {
    
    if (downloadingProcces == nil) {
        
        downloadingProcces = [[NSMutableSet alloc] init];
    }
    return downloadingProcces;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _serviceAmazon = [[ServiceAmazon alloc] init];
    }
    return self;
}

- (void)getLogoBackgroungImageWithId:(NSString *)imageId completion:(void(^)(UIImage *image))completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
    
        NSString *folderPath = [self getLogoBackgroundPath];
        NSString *path = [folderPath stringByAppendingPathComponent:imageId];
        BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];
        if (fileExists) {
            
            completion([UIImage imageWithContentsOfFile:path]);
            return;
        } else {
            
            if ([self.downloadingProcces containsObject:path]) {
                
                NSLog(@"WARNING ::: already downloading");
                return;
            }
            
            [self.downloadingProcces addObject:path];
            
            [self.serviceAmazon downloadAWSPhotoWithBucketName:kAWSLogoBackgroundBucketName
                                                     imageName:imageId
                                                        toPath:path
                                                    completion:^(NSError *error) {
                                                        
                                                        [self.downloadingProcces removeObject:path];
                                                        
                                                        if (error) {
                                                            
                                                            completion(nil);
                                                        } else {
                                                            
                                                            //change saved image
                                                            [self rewriteImageFromPath:path];
                                                            completion([UIImage imageWithContentsOfFile:path]);
                                                        }
                                                    }];
        }
    });
}

- (void)rewriteImageFromPath:(NSString *)path {
    
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    if (image) {
        
        UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
        
        [image drawAtPoint:CGPointZero];
        
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:path atomically:YES];
    }
    
}

- (NSString *)getLogoBackgroundPath {
    
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:@"/LogoBackground"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error]; //Create folder
    
    return dataPath;
}

@end
