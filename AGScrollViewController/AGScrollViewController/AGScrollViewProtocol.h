//
//  AGScrollViewProtocol.h
//  AGScrollViewController
//
//  Created by 吴书敏 on 2018/4/13.
//  Copyright © 2018年 吴书敏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class AGScrollContentView;
@class AGScrollMenuView;

@protocol AGScrollContentViewDelegate <NSObject>

- (void)agScrollContentViewDidScroll:(AGScrollContentView *)contentView;
- (void)agScrollContentViewDidEndDecelerating:(NSIndexPath *)indexPath;

@end


@protocol AGScrollMenuViewDelegate <NSObject>

- (void)agScrollMenuView:(AGScrollMenuView *)menuView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

