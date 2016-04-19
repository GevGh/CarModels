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
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

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

- (void)startLoading {
    
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    self.tableViewMain.hidden = YES;
}

- (void)stopLoading {
    
    [self.activityIndicator stopAnimating];
    [self.activityIndicator removeFromSuperview];
    self.tableViewMain.alpha = 0.0;
    self.tableViewMain.hidden = NO;
    [UIView animateWithDuration:0.3
                     animations:^{
                         
                         self.tableViewMain.alpha = 1.0;
                     }];
}

- (void)setupUI {
    
    self.activityIndicator.hidden = YES;
    self.imageViewLogo.image = [UIImage imageNamed:self.modelInfo.imageName];
    
    self.tableViewMain.delegate = self;
    self.tableViewMain.dataSource = self;
}

- (void)loadDataFromCoreData {
    
    self.companyCD = [self.serviceCompany getCompanyInfoWithID:self.modelInfo.identifier];
    if (self.companyCD == nil) {
        
        //TODO::: start loading data
        [self startLoading];
    } else {
        
        [self reloadTableView];
    }
}

- (void)loadDatafromServer {
    
    [self.serviceCompany loadCompanyInfoWithId:self.modelInfo.identifier
                                    completion:^(CoreDataCompany *company) {
                                        
                                        [self stopLoading];
                                        if (!company) {
                                            
                                            NSLog(@"CRASH ::: ERROR ");
                                            return ;
                                        }
                                        
                                        self.companyCD = company;
                                        [self reloadTableView];
                                    }];
}

- (void)reloadTableView {
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"order" ascending:YES];
    self.categoriesData = [self.companyCD.categories sortedArrayUsingDescriptors:@[sortDescriptor]];

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
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"order" ascending:YES];
        modelVC.modelsData = [category.models sortedArrayUsingDescriptors:@[sortDescriptor]];

        modelVC.awsBucketName = self.awsBucketName;
        modelVC.navTitle = category.name;
    }
}

@end
