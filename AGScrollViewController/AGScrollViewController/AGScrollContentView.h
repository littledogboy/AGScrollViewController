//
//  AGScrollContentView.h
//  AGScrollViewController
//
//  Created by 吴书敏 on 2018/4/11.
//  Copyright © 2018年 吴书敏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGScrollTheme.h"
#import "AGScrollViewProtocol.h"

@interface AGScrollContentView : UICollectionView <AGScrollMenuViewDelegate>

@property (nonatomic, strong) NSArray<UIViewController *> *viewControllers;
@property (nonatomic, strong) AGScrollTheme *scrollTheme;
@property (nonatomic, weak) id <AGScrollContentViewDelegate> scrollDelegate;

- (instancetype)initWithFrame:(CGRect)frame
                  scrollTheme:(AGScrollTheme *)scrollTheme;


@end
