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

@property (strong, nonatomic) NSString *imageId;

@end

@implementation LogoTableViewCell

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

- (void)configureViewWithModel:(ModelLogoInfo *)logoInfo {
    
    self.imageId = logoInfo.identifier;
    
    self.imageViewLogo.image = [UIImage imageNamed:logoInfo.imageName];
    self.labelLogoName.text = logoInfo.logoName;
    [[ServiceImageDownloadingCaching sharedInstance] getLogoBackgroungImageWithId:logoInfo.identifier
                                                                       completion:^(UIImage *image) {
                                                                                                                                                      
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
