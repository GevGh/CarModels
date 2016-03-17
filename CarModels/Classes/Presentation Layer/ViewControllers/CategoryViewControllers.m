//
//  CategoryViewControllers.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-17.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CategoryViewControllers.h"
#import "ModelLogoInfo.h"
#import "ServiceFireBase.h"

@interface CategoryViewControllers ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewLogo;

@property (strong, nonatomic) ServiceFireBase *serviceFireBase;

@end

@implementation CategoryViewControllers

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        _serviceFireBase = [[ServiceFireBase alloc] init];
    }
    return self;
}

- (IBAction)buttonHandlerBack:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupUI];
    [self loadDataIfNeeded];
}

- (void)setupUI {
    
    self.imageViewLogo.image = [UIImage imageNamed:self.modelInfo.imageName];
}

- (void)loadDataIfNeeded {
    
    [self.serviceFireBase loadCategoryForModel:self.modelInfo];
}

@end
