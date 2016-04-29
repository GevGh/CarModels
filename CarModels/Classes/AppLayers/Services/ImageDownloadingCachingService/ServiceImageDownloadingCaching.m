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

+ (instancetype)sharedInstance {
    
    static ServiceImageDownloadingCaching *downloadingService;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        downloadingService = [[ServiceImageDownloadingCaching alloc] init];
        downloadingService.serviceAmazon = [[ServiceAmazon alloc] init];
    });
    return downloadingService;
}

- (void)cancelDownloadinRequestForKey:(NSString *)key {
    
    [self.serviceAmazon cancelDownloadinRequestForKey:key];
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
            
            
            
            
            [self.serviceAmazon downloadAWSPhotoWithBucketName:kAWSLogoBackgroundBucketName
                                                     imageName:imageId
                                                        toPath:path
                                                    completion:^(NSError *error) {
                                                        
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

- (void)getImageForBucket:(NSString *)bucket
                  imageID:(NSString *)imageID
               completion:(void(^)(UIImage *image))completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        NSString *folderPath = [self getCompanyImagePathWithBucketName:bucket];
        NSString *path = [folderPath stringByAppendingPathComponent:imageID];
        BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];
        if (fileExists) {
            
            completion([UIImage imageWithContentsOfFile:path]);
            return;
        } else {
            
            [self.serviceAmazon downloadAWSPhotoWithBucketName:bucket
                                                     imageName:imageID
                                                        toPath:path
                                                    completion:^(NSError *error) {
                                                        
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

- (NSString *)getCompanyImagePathWithBucketName:(NSString *)bucketName {
    
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    NSString *folderPath = [documentsDirectory stringByAppendingPathComponent:@"/images"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath])
        [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:NO attributes:nil error:&error]; //Create folder
    
    
    NSString *bucketFolderPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@", bucketName]];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:bucketFolderPath])
        [[NSFileManager defaultManager] createDirectoryAtPath:bucketFolderPath withIntermediateDirectories:NO attributes:nil error:&error]; //Create folder
    
    return bucketFolderPath;
}

@end
