//
//  SecondViewController.m
//  Demo_CollectionView
//
//  Created by GrayLeo on 2017/12/2.
//  Copyright © 2017年 GrayLeo. All rights reserved.
//

#import "SecondViewController.h"
#import "CollectionViewWaterFlowLayout.h"

@interface SecondViewController () <UICollectionViewDataSource, UICollectionViewDelegate, WaterFlowLayoutDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CollectionViewWaterFlowLayout *layout = [[CollectionViewWaterFlowLayout alloc] init];
    layout.delegate = self;
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 99;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"--GrayLeo-- tap indexPath(%ld, %ld)", (long)indexPath.section, (long)indexPath.row);
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) {
    cell.backgroundColor = [UIColor redColor];
}

#pragma mark - WaterFlowLayoutDelegate

//决定cell的高度,必须实现方法
- (CGFloat)waterFlowLayout:(CollectionViewWaterFlowLayout *)waterFlowLayout heightForRowAtIndex:(NSInteger)index itemWidth:(CGFloat)width {
    return arc4random()%200 + 60;
}


@end
