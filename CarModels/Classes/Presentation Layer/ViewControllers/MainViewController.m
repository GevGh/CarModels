//
//  MainViewController.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-01.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "MainViewController.h"
#import "ServiceLogo.h"
#import "ModelLogoInfo.h"
#import "LogoTableViewCell.h"

#import "CategoryViewControllers.h"
#import "CarModelsViewController.h"

#import "MoPub.h"
#import "Constant.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, MPInterstitialAdControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;

@property (strong, nonatomic) ServiceLogo *serviceLogo;

@property (strong, nonatomic) NSArray <__kindof ModelLogoInfo*> *  arrayLogoModels;

@property (nonatomic, retain) MPInterstitialAdController *interstitial;

@end

@implementation MainViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self loadAdd];

    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.hidden = YES;
    
    self.serviceLogo = [[ServiceLogo alloc] init];
    self.arrayLogoModels = [self.serviceLogo getAllLogoModels];
    
    self.tableViewMain.delegate = self;
    self.tableViewMain.dataSource = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showAd)
                                                 name:kShowAdNotification
                                               object:nil];
}

- (void)loadAdd {
    
    // TODO: Replace this test id with your personal ad unit id
    self.interstitial = [MPInterstitialAdController interstitialAdControllerForAdUnitId:@"77ce0b65cf81438eb255695afe3b1904"];
    self.interstitial.delegate = self;
    
    // Pre-fetch the ad up front
    [self.interstitial loadAd];
}

- (void)showAd {
    
    if (self.interstitial.ready) {
        
        [self.interstitial showFromViewController:self];
    }
}


#pragma mark - <MPInterstitialAdControllerDelegate>
- (void)interstitialDidLoadAd:(MPInterstitialAdController *)interstitial {
    // This sample automatically shows the ad as soon as it's loaded, but
    // you can move this showFromViewController call to a time more
    // appropriate for your app.
    //    if (interstitial.ready) {
    // Ad will dismiss itself
    //        [interstitial showFromViewController:self];
    //    }
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self scrollViewDidScroll:self.tableViewMain];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrayLogoModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LogoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLogoTableViewCellIdentifier
                                                              forIndexPath:indexPath];
    
    [cell configureViewWithModel:[self.arrayLogoModels objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ModelLogoInfo *info = [self.arrayLogoModels objectAtIndex:indexPath.row];
    
    if (info.haveCategories) {
        
        
        [self performSegueWithIdentifier:@"mainToCategory"
                                  sender:info];
    } else {
        
        [self performSegueWithIdentifier:@"mainToCarModel"
                                  sender:info];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSArray *cells = [self.tableViewMain visibleCells];
    for (LogoTableViewCell *cell in cells) {
    
        [cell cellInTableView:self.tableViewMain DidScrollOnView:self.view];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"mainToCategory"]) {
        
        CategoryViewControllers *vc = (CategoryViewControllers *)segue.destinationViewController;
        vc.modelInfo = sender;
    } else if ([segue.identifier isEqualToString:@"mainToCarModel"]) {
        
        CarModelsViewController *vc = (CarModelsViewController *)segue.destinationViewController;
        
        vc.isFromMain = YES;
    }
}

@end
