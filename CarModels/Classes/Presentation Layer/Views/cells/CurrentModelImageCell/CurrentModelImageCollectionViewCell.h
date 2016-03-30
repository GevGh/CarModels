//
//  CurrentModelImageCollectionViewCell.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-29.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const kCurrentModelImageCollectionViewCellID = @"CurrentModelImageCollectionViewCellID";

@interface CurrentModelImageCollectionViewCell : UICollectionViewCell

- (void)configureWithImageId:(NSString *)imageId bucketName:(NSString *)bucketName;

@end
