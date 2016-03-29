//
//  CarModelTableViewCell.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-27.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CarModelTableViewCell.h"
#import "CoreDataCarModel.h"
#import "ServiceImageDownloadingCaching.h"

@interface CarModelTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *viewMain;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewBackground;
@property (weak, nonatomic) IBOutlet UIView *viewAlpha;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@property (strong, nonatomic) ServiceImageDownloadingCaching *serviceImageDownloading;

@end

@implementation CarModelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.serviceImageDownloading = [[ServiceImageDownloadingCaching alloc] init];
}

- (void)configureWithCarModel:(CoreDataCarModel *)model
                   bucketName:(NSString *)bucketName {
    
    self.labelName.text = model.name;
    
    NSArray *imageURLs = model.imageIds;
    
    NSString *firstUrl = imageURLs.firstObject;
    
    [self.serviceImageDownloading getImageForBucket:bucketName
                                            imageID:firstUrl
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
