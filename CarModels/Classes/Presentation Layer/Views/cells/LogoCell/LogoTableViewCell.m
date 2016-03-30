//
//  LogoTableViewCell.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-08.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "LogoTableViewCell.h"
#import "ModelLogoInfo.h"
#import "ServiceImageDownloadingCaching.h"

@interface LogoTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *viewMain;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewBackground;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLogo;
@property (weak, nonatomic) IBOutlet UILabel *labelLogoName;

@property (strong, nonatomic) ServiceImageDownloadingCaching *serviceImageDownloading;

@end

@implementation LogoTableViewCell

- (void)awakeFromNib {

    [super awakeFromNib];
    self.viewMain.backgroundColor = [UIColor clearColor];
    self.serviceImageDownloading = [[ServiceImageDownloadingCaching alloc] init];
}

- (void)prepareForReuse {
    
    [super prepareForReuse];
    self.imageViewBackground.image = nil;
}

- (void)configureViewWithModel:(ModelLogoInfo *)logoInfo {
    
    self.imageViewLogo.image = [UIImage imageNamed:logoInfo.imageName];
    self.labelLogoName.text = logoInfo.logoName;
    [self.serviceImageDownloading getLogoBackgroungImageWithId:logoInfo.identifier
                                                    completion:^(UIImage *image) {
                                                        
                                                        NSLog(@"%@", image);
                                                        
                                                        // Decompress image
                                                        if (image) {
                                                            
                                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                                
                                                                self.imageViewBackground.image = image;
                                                            });
                                                        }
                                                    }];
}

- (void)cellInTableView:(UITableView *)tableView DidScrollOnView:(UIView *)view {
    
    CGRect rectInSuperview = [tableView convertRect:self.frame toView:view];
    
    float distanceFromCenter = view.frame.size.height/2 - CGRectGetMinY(rectInSuperview);
    float difference = self.imageViewBackground.frame.size.height - self.frame.size.height;
    float move = distanceFromCenter/ view.frame.size.height * difference;
    
    CGRect imageRect = self.imageViewBackground.frame;
    imageRect.origin.y = -(difference/2) + move;
    self.imageViewBackground.frame = imageRect;
}

@end
