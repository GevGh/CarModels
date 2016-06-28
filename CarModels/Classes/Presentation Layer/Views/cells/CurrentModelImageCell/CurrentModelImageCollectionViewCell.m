//
//  CurrentModelImageCollectionViewCell.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-29.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CurrentModelImageCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface CurrentModelImageCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) NSString *imageId;

@end

@implementation CurrentModelImageCollectionViewCell


- (void)configureWithImageId:(NSString *)imageId bucketName:(NSString *)bucketName {
    
    self.imageId = imageId;
    
    
    NSString *url = [NSString stringWithFormat:@"https://%@.s3.amazonaws.com/%@", bucketName, imageId];
    
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:url]
                      placeholderImage:nil
                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                 
                             }];
}

@end
