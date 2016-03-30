//
//  CategoryViewControllers.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-17.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CategoryViewControllers.h"
#import "ModelLogoInfo.h"
#import "ServiceCompany.h"
#import "CoreDataCompany.h"
#import "CoreDataCategory.h"
#import "CategoryTableViewCell.h"
#import "CarModelsViewController.h"

@interface CategoryViewControllers () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *imageViewLogo;
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;

@property (strong, nonatomic) ServiceCompany *serviceCompany;
@property (strong, nonatomic) CoreDataCompany *companyCD;

@property (strong, nonatomic) NSArray *categoriesData;
@property (strong, nonatomic) NSString *awsBucketName;

@end

@implementation CategoryViewControllers

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        _serviceCompany = [[ServiceCompany alloc] init];
    }
    return self;
}

- (IBAction)buttonHandlerBack:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupUI];
    [self loadDataFromCoreData];
    [self loadDatafromServer];
}

- (void)setupUI {
    
    self.imageViewLogo.image = [UIImage imageNamed:self.modelInfo.imageName];
    
    self.tableViewMain.delegate = self;
    self.tableViewMain.dataSource = self;
}

- (void)loadDataFromCoreData {
    
    self.companyCD = [self.serviceCompany getCompanyInfoWithID:self.modelInfo.identifier];
    if (self.companyCD == nil) {
        
        //TODO::: start loading data
    } else {
        
        [self reloadTableView];
    }
}

- (void)loadDatafromServer {
    
    [self.serviceCompany loadCompanyInfoWithId:self.modelInfo.identifier
                                    completion:^(CoreDataCompany *company) {
                                        
                                        if (!company) {
                                            
                                            NSLog(@"CRASH ::: ERROR ");
                                            return ;
                                        }
                                        
                                        self.companyCD = company;
                                        [self reloadTableView];
                                    }];
}

- (void)reloadTableView {
    
    self.categoriesData = self.companyCD.categories.allObjects;
    self.awsBucketName = self.companyCD.awsBucketName;
    
    [self.tableViewMain reloadData];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.tableViewMain.layer addAnimation:transition forKey:nil];
}

#pragma UITableViewDataSource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.categoriesData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCategoryTableViewCellIdentifier forIndexPath:indexPath];
    
    [cell configureWithCategoryModel:[self.categoriesData objectAtIndex:indexPath.row]
                          bucketName:self.awsBucketName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"categoryToCarModel" sender:[self.categoriesData objectAtIndex:indexPath.row]];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
    if ([segue.identifier isEqualToString:@"categoryToCarModel"]) {
        
        CarModelsViewController *modelVC = (CarModelsViewController *)segue.destinationViewController;
        CoreDataCategory *category = sender;
        modelVC.modelsData = category.models.allObjects;
        modelVC.awsBucketName = self.awsBucketName;
        modelVC.navTitle = category.name;
    }
}

@end
