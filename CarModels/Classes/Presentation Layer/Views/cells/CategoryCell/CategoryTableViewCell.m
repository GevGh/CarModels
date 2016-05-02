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

@property (strong, nonatomic) NSString *imageId;

@end

@implementation CategoryTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.viewMain.backgroundColor = [UIColor clearColor];
    
}

- (void)prepareForReuse {
    
    [super prepareForReuse];
    if (self.imageId) {
        
        self.imageViewBackground.image = nil;
        [[ServiceImageDownloadingCaching sharedInstance] cancelDownloadinRequestForKey:self.imageId];
    }
}

- (void)configureWithCategoryModel:(CoreDataCategory *)category
                        bucketName:(NSString *)bucketName {
    
    self.imageId = category.imageId;
    self.labelName.text = category.name;
    
    [[ServiceImageDownloadingCaching sharedInstance] getImageForBucket:bucketName
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

@end
