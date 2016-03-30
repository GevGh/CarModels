//
//  EngineInfoTableViewCell.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-30.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const kEngineInfoTableViewCellID = @"EngineInfoTableViewCellID";

@interface EngineInfoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelKey;
@property (weak, nonatomic) IBOutlet UILabel *labelEngineName;
@property (weak, nonatomic) IBOutlet UILabel *labelValue;

@end
