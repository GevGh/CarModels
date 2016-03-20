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

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;

@property (strong, nonatomic) ServiceLogo *serviceLogo;

@property (strong, nonatomic) NSArray <__kindof ModelLogoInfo*> *  arrayLogoModels;

@end

@implementation MainViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.hidden = YES;
    
    self.serviceLogo = [[ServiceLogo alloc] init];
    self.arrayLogoModels = [self.serviceLogo getAllLogoModels];
    
    self.tableViewMain.delegate = self;
    self.tableViewMain.dataSource = self;
    
}

- (void)viewDidAppear:(BOOL)animated {
    
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
    
    [self performSegueWithIdentifier:@"mainToCategory"
                              sender:[self.arrayLogoModels objectAtIndex:indexPath.row]];
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
    }
}

@end
