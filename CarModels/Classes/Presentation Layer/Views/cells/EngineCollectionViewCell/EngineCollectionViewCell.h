//
//  EngineCollectionViewCell.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-30.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreDataEngine;

static NSString * const kEngineCollectionViewCellID = @"EngineCollectionViewCellID";

@interface EngineCollectionViewCell : UICollectionViewCell

- (void)configureWithEngine:(CoreDataEngine *)engine;

@end
