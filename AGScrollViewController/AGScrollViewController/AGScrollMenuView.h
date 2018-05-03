//
//  AGScrollMenuView.h
//  AGScrollViewController
//
//  Created by 吴书敏 on 2018/4/11.
//  Copyright © 2018年 吴书敏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGScrollTheme.h"
#import "AGScrollViewProtocol.h"

@interface AGScrollMenuView : UICollectionView  <AGScrollContentViewDelegate>

@property (nonatomic, strong, readonly) UIView *scrollLine;
@property (nonatomic, strong, readonly) UIView *bottomLine;
@property (nonatomic, weak) id <AGScrollMenuViewDelegate> scrollDelegate;
@property (nonatomic, strong) NSArray<NSString *> *menuTitles;
@property (nonatomic, strong) NSString *registCellIdentifier;

- (instancetype)initWithFrame:(CGRect)frame
                  scrollTheme:(AGScrollTheme *)scrollTheme;
@end
