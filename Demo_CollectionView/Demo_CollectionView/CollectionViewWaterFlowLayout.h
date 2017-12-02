//
//  CollectionViewWaterFlowLayout.h
//  Demo_CollectionView
//
//  Created by GrayLeo on 2017/12/2.
//  Copyright © 2017年 GrayLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollectionViewWaterFlowLayout;

@protocol WaterFlowLayoutDelegate <NSObject>

@required
//决定cell的高度,必须实现方法
- (CGFloat)waterFlowLayout:(CollectionViewWaterFlowLayout *)waterFlowLayout heightForRowAtIndex:(NSInteger)index itemWidth:(CGFloat)width;

@optional
//决定cell的列数
- (NSInteger)cloumnCountInWaterFlowLayout:(CollectionViewWaterFlowLayout *)waterFlowLayout;

//决定cell 的列的距离
- (CGFloat)columMarginInWaterFlowLayout:(CollectionViewWaterFlowLayout *)waterFlowLayout;

//决定cell 的行的距离
- (CGFloat)rowMarginInWaterFlowLayout:(CollectionViewWaterFlowLayout *)waterFlowLayout;

//决定cell 的边缘距
- (UIEdgeInsets)edgeInsetInWaterFlowLayout:(CollectionViewWaterFlowLayout *)waterFlowLayout;

@end


@interface CollectionViewWaterFlowLayout : UICollectionViewFlowLayout
@property (nonatomic,weak) id <WaterFlowLayoutDelegate> delegate;

@property (nonatomic,strong) NSMutableArray *attrsArray;
@property (nonatomic,strong) NSMutableArray *columnHeight;


- (NSInteger)columCount;
- (CGFloat)columMargin;
- (CGFloat)rowMargin;
- (UIEdgeInsets)defaultEdgeInsets;

@end
