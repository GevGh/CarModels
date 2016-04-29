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

@property (strong, nonatomic) NSString *imageId;

@end

@implementation CurrentModelImageCollectionViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)prepareForReuse {
    
    [super prepareForReuse];
    if (self.imageId) {
        
        self.imageView.image = nil;
        [[ServiceImageDownloadingCaching sharedInstance] cancelDownloadinRequestForKey:self.imageId];
    }
}

- (void)configureWithImageId:(NSString *)imageId bucketName:(NSString *)bucketName {
    
    self.imageId = imageId;
    [[ServiceImageDownloadingCaching sharedInstance] getImageForBucket:bucketName
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
