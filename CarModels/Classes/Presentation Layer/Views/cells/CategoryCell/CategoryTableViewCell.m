//
//  CategoryTableViewCell.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-27.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CategoryTableViewCell.h"
#import "CoreDataCategory.h"
#import "ServiceImageDownloadingCaching.h"

@interface CategoryTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *viewMain;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewBackground;
@property (weak, nonatomic) IBOutlet UIView *viewAlpha;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@property (strong, nonatomic) ServiceImageDownloadingCaching *serviceImageDownloading;

@end

@implementation CategoryTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.viewMain.backgroundColor = [UIColor clearColor];
    self.serviceImageDownloading = [[ServiceImageDownloadingCaching alloc] init];
}

-(void)prepareForReuse {
    
    self.imageViewBackground.image = nil;
}

- (void)configureWithCategoryModel:(CoreDataCategory *)category
                        bucketName:(NSString *)bucketName {
    
    self.labelName.text = category.name;
    
    [self.serviceImageDownloading getImageForBucket:bucketName
                                            imageID:category.imageId
                                         completion:^(UIImage *image) {
                                             
                                             // Decompress image
                                             if (image) {
                                                 
                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                     
                                                     self.imageViewBackground.image = image;
                                                 });
                                             }
                                         }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
