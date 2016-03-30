//
//  CurrentModelImageCollectionViewCell.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-29.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CurrentModelImageCollectionViewCell.h"
#import "ServiceImageDownloadingCaching.h"

@interface CurrentModelImageCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) ServiceImageDownloadingCaching *serviceImageDownloading;

@end

@implementation CurrentModelImageCollectionViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.serviceImageDownloading = [[ServiceImageDownloadingCaching alloc] init];
}

- (void)prepareForReuse {
    
    [super prepareForReuse];
    self.imageView.image = nil;
}

- (void)configureWithImageId:(NSString *)imageId bucketName:(NSString *)bucketName {
    
    
    [self.serviceImageDownloading getImageForBucket:bucketName
                                            imageID:imageId
                                         completion:^(UIImage *image) {
                                             
                                             // Decompress image
                                             if (image) {
                                                 
                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                     
                                                     self.imageView.image = image;
                                                 });
                                             }
                                         }];
}

@end
