//
//  AGScrollMenuTitleCell.h
//  AGScrollViewController
//
//  Created by 吴书敏 on 2018/4/11.
//  Copyright © 2018年 吴书敏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGScrollTheme.h"

@interface AGScrollMenuTitleCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong)  AGScrollTheme *theme;
@property (nonatomic, getter=isChoosed) BOOL choosed;

@end
