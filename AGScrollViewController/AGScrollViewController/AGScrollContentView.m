//
//  AGScrollContentView.m
//  AGScrollViewController
//
//  Created by 吴书敏 on 2018/4/11.
//  Copyright © 2018年 吴书敏. All rights reserved.
//

#import "AGScrollContentView.h"
#import "AGScrollMenuView.h"
#import <Masonry.h>


static NSString * const kAGScrollContentCellIdentifier = @"kAGScrollContentCellIdentifier";

@interface AGScrollContentView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) NSInteger lastSelectedIndex;

@end

@implementation AGScrollContentView

#pragma mark - Lifecycle

- (instancetype)initWithFrame:(CGRect)frame
                  scrollTheme:(AGScrollTheme *)scrollTheme {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.scrollTheme = scrollTheme;
        self.delegate = self;
        self.dataSource = self;
        self.pagingEnabled = YES;
        self.lastSelectedIndex = 0;
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kAGScrollContentCellIdentifier];
    }
    return self;
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewControllers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kAGScrollContentCellIdentifier forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIViewController *vc = self.viewControllers[indexPath.item];
    [cell.contentView addSubview:vc.view];
    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.height.mas_equalTo(cell.contentView);
    }];
    return cell;
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
     if (self.scrollDelegate && [self.scrollDelegate respondsToSelector:@selector(agScrollContentViewDidScroll:)]) {
         [self.scrollDelegate agScrollContentViewDidScroll:self];
     }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.scrollDelegate && [self.scrollDelegate respondsToSelector:@selector(agScrollContentViewDidEndDecelerating:)]) {
        NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:page inSection:0];
        [self.scrollDelegate agScrollContentViewDidEndDecelerating:indexPath];
        self.lastSelectedIndex = page;
    }
}

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.frame.size;
}

#pragma mark - <AGScrollMenuViewDelegate>

- (void)agScrollMenuView:(AGScrollMenuView *)menuView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat offsetX = indexPath.item * self.frame.size.width;
    if (labs(indexPath.item - self.lastSelectedIndex) > 1) {
        [self setContentOffset:CGPointMake(offsetX, 0) animated:NO];
    } else {
        [self setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    }
    self.lastSelectedIndex = indexPath.item;
}

#pragma mark - Lazy Load

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers {
    _viewControllers = viewControllers;
    [self reloadData];
}

@end
