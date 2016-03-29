//
//  CategoryTableViewCell.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-27.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreDataCategory;

static NSString * const kCategoryTableViewCellIdentifier = @"CategoryTableViewCellID";

@interface CategoryTableViewCell : UITableViewCell

- (void)configureWithCategoryModel:(CoreDataCategory *)category
                        bucketName:(NSString *)bucketName;

@end
