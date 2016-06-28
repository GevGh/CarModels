//
//  CategoryTableViewCell.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-27.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CategoryTableViewCell.h"
#import "CoreDataCategory.h"
#import "UIImageView+WebCache.h"

@interface CategoryTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *viewMain;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewBackground;
@property (weak, nonatomic) IBOutlet UIView *viewAlpha;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@property (strong, nonatomic) NSString *imageId;

@end

@implementation CategoryTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.viewMain.backgroundColor = [UIColor clearColor];
    
}

- (void)configureWithCategoryModel:(CoreDataCategory *)category
                        bucketName:(NSString *)bucketName {
    
    self.imageId = category.imageId;
    self.labelName.text = category.name;
    
    NSString *url = [NSString stringWithFormat:@"https://%@.s3.amazonaws.com/%@", bucketName, category.imageId];

    
    [self.imageViewBackground sd_setImageWithURL:[NSURL URLWithString:url]
                                placeholderImage:nil
                                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                           
                                       }];
}

@end
