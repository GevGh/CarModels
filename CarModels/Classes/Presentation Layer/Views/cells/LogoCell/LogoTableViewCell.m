//
//  LogoTableViewCell.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-08.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "LogoTableViewCell.h"
#import "ModelLogoInfo.h"

@interface LogoTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *viewMain;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewBackground;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLogo;
@property (weak, nonatomic) IBOutlet UILabel *labelLogoName;

@end

@implementation LogoTableViewCell

- (void)awakeFromNib {

    [super awakeFromNib];
    self.viewMain.backgroundColor = [UIColor clearColor];
}

- (void)configureViewWithModel:(ModelLogoInfo *)logoInfo {
    
    self.imageViewLogo.image = [UIImage imageNamed:logoInfo.imageName];
    self.labelLogoName.text = logoInfo.logoName;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
