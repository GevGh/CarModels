//
//  CarModelsViewController.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-27.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CarModelsViewController.h"
#import "CarModelTableViewCell.h"
#import "CurrentModelViewController.h"

@interface CarModelsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property (weak, nonatomic) IBOutlet UILabel *labelNavTitle;

@end

@implementation CarModelsViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    
//    self.imageViewLogo.image = [UIImage imageNamed:self.modelInfo.imageName];
    
    self.labelNavTitle.text = self.navTitle;
    
    self.tableViewMain.delegate = self;
    self.tableViewMain.dataSource = self;
}

- (IBAction)buttonHandlerBack:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma UITableViewDataSource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.modelsData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CarModelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCarModelTableViewCellIdentifier forIndexPath:indexPath];
    
    [cell configureWithCarModel:[self.modelsData objectAtIndex:indexPath.row]
                     bucketName:self.awsBucketName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"modelsToCurrentModel" sender:self.modelsData[indexPath.row]];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"modelsToCurrentModel"]) {
        
        CurrentModelViewController *modelVC = (CurrentModelViewController *)segue.destinationViewController;
        CoreDataCarModel *model = sender;
        modelVC.carModel = model;
        modelVC.bucketName = self.awsBucketName;
    }
}

@end
