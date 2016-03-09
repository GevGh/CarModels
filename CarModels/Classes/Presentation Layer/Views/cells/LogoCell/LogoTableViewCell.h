//
//  LogoTableViewCell.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-08.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModelLogoInfo;

static NSString * const kLogoTableViewCellIdentifier = @"LogoTableViewCellID";

@interface LogoTableViewCell : UITableViewCell

- (void)configureViewWithModel:(ModelLogoInfo *)logoInfo;

@end
