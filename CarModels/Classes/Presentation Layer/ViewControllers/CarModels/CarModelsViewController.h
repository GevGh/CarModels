//
//  CarModelsViewController.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-27.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreDataCategory;

@interface CarModelsViewController : UIViewController

@property (strong, nonatomic) NSArray *modelsData;
@property (strong, nonatomic) NSString *awsBucketName;
@property (strong, nonatomic) NSString *navTitle;

@property (nonatomic) BOOL isFromMain;

@end
