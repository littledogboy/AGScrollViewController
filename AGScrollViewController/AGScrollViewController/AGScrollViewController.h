//
//  AGScrollViewController.h
//  AGScrollViewController
//
//  Created by 吴书敏 on 2018/4/11.
//  Copyright © 2018年 吴书敏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGScrollTheme.h"
#import "AGScrollMenuView.h"
#import "AGScrollContentView.h"
#import "AGScrollMenuTitleCell.h"

@interface AGScrollViewController : UIViewController

@property (nonatomic, strong, readonly) AGScrollMenuView *menuView;
@property (nonatomic, strong, readonly) AGScrollContentView *contentView;
@property (nonatomic, copy) NSArray<NSString *> *menuTitles;
@property (nonatomic, strong) NSArray<UIViewController *> *viewControllers;
@property (nonatomic, strong) AGScrollTheme *scrollTheme;

- (void)registMenuCell:(Class)menuCellClass;

@end
