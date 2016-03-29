//
//  CarModelTableViewCell.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-27.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreDataCarModel;

static NSString * const kCarModelTableViewCellIdentifier = @"CarModelTableViewCellID";

@interface CarModelTableViewCell : UITableViewCell

- (void)configureWithCarModel:(CoreDataCarModel *)model
                   bucketName:(NSString *)bucketName;
@end
