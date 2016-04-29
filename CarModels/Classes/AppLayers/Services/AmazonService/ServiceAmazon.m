//
//  ServiceAmazon.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-21.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "ServiceAmazon.h"
#import <AWSCore/AWSCore.h>
#import <AWSS3/AWSS3.h>

@interface ServiceAmazon ()

@property (nonatomic, strong) NSMutableDictionary *downloadingImageTasks;

@end

@implementation ServiceAmazon

- (NSMutableDictionary *)downloadingImageTasks {
    
    if (_downloadingImageTasks == nil) {
        
        _downloadingImageTasks = [[NSMutableDictionary alloc] init];
    }
    return _downloadingImageTasks;
}

+ (void)setupAmazonConfigurations {
    
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc]
                                                          initWithRegionType:AWSRegionUSEast1
                                                          identityPoolId:@"us-east-1:a313f813-2a6c-4ea6-8d24-619008937faf"];
    
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
}

- (void)cancelDownloadinRequestForKey:(NSString *)key {
    
    if (!key) {
        return;
    }
    
    AWSS3TransferManagerDownloadRequest *downloadRequest = [self.downloadingImageTasks objectForKey:key];
    
    if (downloadRequest) {
        
        [downloadRequest cancel];
        [self.downloadingImageTasks removeObjectForKey:key];
    }
}

- (void)downloadAWSPhotoWithBucketName:(NSString *)bucketName
                             imageName:(NSString *)imageName
                                toPath:(NSString *)downloadingFilePath
                            completion:(void(^)(NSError *error))completion {
    
    if ([self.downloadingImageTasks objectForKey:imageName]) {
        
        NSLog(@"%@   WARNING ::: already downloading", imageName);
        return;
    }
    
    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    
    // Construct the NSURL for the download location.
    NSURL *downloadingFileURL = [NSURL fileURLWithPath:downloadingFilePath];
    
    // Construct the download request.
    AWSS3TransferManagerDownloadRequest *downloadRequest = [AWSS3TransferManagerDownloadRequest new];
    
    downloadRequest.bucket = bucketName;
    downloadRequest.key = [NSString stringWithFormat:@"%@.jpg", imageName];
    downloadRequest.downloadingFileURL = downloadingFileURL;
    
    [self.downloadingImageTasks setValue:downloadRequest forKey:imageName];
    
    // Download the file.
    [[transferManager download:downloadRequest] continueWithExecutor:[AWSExecutor mainThreadExecutor]
                                                           withBlock:^id(AWSTask *task) {
                                                               
                                                               [self.downloadingImageTasks removeObjectForKey:imageName];
                                                               
                                                               if (task.error){
                                                                   if ([task.error.domain isEqualToString:AWSS3TransferManagerErrorDomain]) {
                                                                       switch (task.error.code) {
                                                                           case AWSS3TransferManagerErrorCancelled:
                                                                           case AWSS3TransferManagerErrorPaused:
                                                                               break;
                                                                               
                                                                           default:
                                                                               NSLog(@"Error: %@", task.error);
                                                                               break;
                                                                       }
                                                                   } else {
                                                                       // Unknown error.
                                                                       NSLog(@"Error: %@", task.error);
                                                                   }
                                                                   completion(task.error);
                                                                   return nil;
                                                               }
                                                               
                                                               if (task.result) {
//                                                                   AWSS3TransferManagerDownloadOutput *downloadOutput = task.result;
                                                                   //File downloaded successfully.
                                                                   completion(nil);
                                                                   return nil;
                                                                   
                                                               }
                                                               return nil;
                                                           }];
}

@end
