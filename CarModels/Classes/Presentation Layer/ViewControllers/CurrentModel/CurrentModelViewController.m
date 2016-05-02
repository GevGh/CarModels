//
//  CurrentModelViewController.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-29.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "CurrentModelViewController.h"
#import "CoreDataCarModel.h"
#import "CurrentModelImageCollectionViewCell.h"
#import "EngineCollectionViewCell.h"
#import "AdLogicService.h"

@interface CurrentModelViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout
>

@property (weak, nonatomic) IBOutlet UILabel *labelNavTitle;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewImages;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewEngines;

@property (strong, nonatomic) NSArray *imagesData;
@property (strong, nonatomic) NSArray *enginesData;

@end

@implementation CurrentModelViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[AdLogicService sharedInstance] openedPoint:4];
    
    [self setupUI];
    self.imagesData = self.carModel.imageIds;
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"order" ascending:YES];
    self.enginesData = [self.carModel.engines sortedArrayUsingDescriptors:@[sortDescriptor]];
}

- (void)setupUI {
    
    [self.view layoutIfNeeded];
    [self.collectionViewImages layoutIfNeeded];
    [self.collectionViewEngines layoutIfNeeded];
    
    self.collectionViewImages.delegate = self;
    self.collectionViewImages.dataSource = self;
    
    self.collectionViewEngines.delegate = self;
    self.collectionViewEngines.dataSource = self;

    self.labelNavTitle.text = self.carModel.name;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
}

- (IBAction)buttonHandlerBack:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UICollectionViewDataSource & Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (collectionView == self.collectionViewImages) {

        return self.imagesData.count;
    } else {
        
        return self.enginesData.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == self.collectionViewImages) {
        
        CurrentModelImageCollectionViewCell *cell = (CurrentModelImageCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCurrentModelImageCollectionViewCellID forIndexPath:indexPath];
        
        [cell configureWithImageId:self.imagesData[indexPath.row]
                        bucketName:self.bucketName];
        
        return cell;
    } else {
        
        
        
        EngineCollectionViewCell *cell = (EngineCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kEngineCollectionViewCellID forIndexPath:indexPath];
        
        [cell configureWithEngine:self.enginesData[indexPath.row]];
        
        return cell;
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == self.collectionViewImages) {
        
        return collectionView.frame.size;
    } else {
        
        return collectionView.frame.size;
    }
}

@end
