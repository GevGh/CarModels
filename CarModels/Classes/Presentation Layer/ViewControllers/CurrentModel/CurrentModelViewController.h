//
//  CurrentModelViewController.h
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-29.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreDataCarModel;

@interface CurrentModelViewController : UIViewController

@property (strong, nonatomic) CoreDataCarModel *carModel;
@property (strong, nonatomic) NSString *bucketName;

@end
