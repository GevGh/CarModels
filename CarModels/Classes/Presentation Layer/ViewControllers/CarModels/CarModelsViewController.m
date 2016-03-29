//
//  CarModelsViewController.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-27.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CarModelsViewController.h"
#import "CarModelTableViewCell.h"

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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
