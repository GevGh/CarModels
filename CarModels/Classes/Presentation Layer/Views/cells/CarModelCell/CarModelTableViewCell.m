//
//  CarModelTableViewCell.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-27.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CarModelTableViewCell.h"
#import "CoreDataCarModel.h"
#import "UIImageView+WebCache.h"

@interface CarModelTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *viewMain;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewBackground;
@property (weak, nonatomic) IBOutlet UIView *viewAlpha;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelYear;

@property (strong, nonatomic) NSString *imageId;

@end

@implementation CarModelTableViewCell

- (void)configureWithCarModel:(CoreDataCarModel *)model
                   bucketName:(NSString *)bucketName {
    
    self.labelName.text = model.name;
    self.labelYear.text = model.production;
    
    NSArray *imageURLs = model.imageIds;
    NSString *firstUrl = imageURLs.firstObject;
    
    self.imageId = firstUrl;

    
    NSString *url = [NSString stringWithFormat:@"https://%@.s3.amazonaws.com/%@", bucketName, firstUrl];
    
    
    [self.imageViewBackground sd_setImageWithURL:[NSURL URLWithString:url]
                                placeholderImage:nil
                                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                           
                                       }];
}

@end
