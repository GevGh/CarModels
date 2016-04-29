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
@property (weak, nonatomic) IBOutlet UILabel *labelYear;

@property (strong, nonatomic) NSString *imageId;

@end

@implementation CarModelTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)prepareForReuse {
    
    [super prepareForReuse];
    
    if (self.imageId) {
        
        self.imageViewBackground.image = nil;
        [[ServiceImageDownloadingCaching sharedInstance] cancelDownloadinRequestForKey:self.imageId];
    }
    
}

- (void)configureWithCarModel:(CoreDataCarModel *)model
                   bucketName:(NSString *)bucketName {
    
    self.labelName.text = model.name;
    self.labelYear.text = [NSString stringWithFormat:@"%@ - %@", model.yearBegan, model.yearEnd];
    
    NSArray *imageURLs = model.imageIds;
    NSString *firstUrl = imageURLs.firstObject;
    
    self.imageId = firstUrl;
    
    [[ServiceImageDownloadingCaching sharedInstance] getImageForBucket:bucketName
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

@end
