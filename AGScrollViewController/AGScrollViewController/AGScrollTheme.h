//
//  AGScrollTheme.h
//  AGScrollViewController
//
//  Created by 吴书敏 on 2018/4/11.
//  Copyright © 2018年 吴书敏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - AGAGScrollThemeMacro

#define AGScrollThemeRGBColor(r, g, b) AGScrollThemeRGBAColor(r, g, b, 1.0)
#define AGScrollThemeRGBAColor(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#pragma mark - AGScrollThemeDefault
extern NSString * const kAGScrollThemeDefaultMenuViewHeight; // 菜单视图高度
extern NSString * const kAGScrollThemeDefaultMenuViewBGColor; // 菜单视图背景色

extern NSString * const kAGScrollThemeDefaultMenuTitleViewHeight; // 标题视图高度
extern NSString * const kAGScrollThemeDefaultMenuTitleViewMargin; // 标题视图与菜单视图的间距

extern NSString * const kAGScrollThemeDefaultMenuTitleNormalFont; // 标题字体
extern NSString * const kAGScrollThemeDefaultMenuTitleHighlightedFont; // 标题高亮字体
extern NSString * const kAGScrollThemeDefaultMenuTitleNormalColor; // 标题颜色
extern NSString * const kAGScrollThemeDefaultMenuTitleHighlightedColor; // 标题高亮颜色
extern NSString * const kAGScrollThemeDefaultMenuTitleHorizonSpacing; // 标题水平间距

extern NSString * const kAGScrollThemeDefaultMenuScrollLineBeyondWidth; // 滚动条比标题多出来的平均长度 beyondWidth = (line.width - title.width) / 2.0
extern NSString * const kAGScrollThemeDefaultMenuScrollLineHeight; // 滚动条高度
extern NSString * const kAGScrollThemeDefaultMenuScrollLineColor; // 滚动条颜色

extern NSString * const kAGScrollThemeDefaultMenuBottomLineHeight; // 底部条高度
extern NSString * const kAGScrollThemeDefaultMenuBottomLineColor; // 底部条颜色


@protocol AGScrollThemeDelegate <NSObject>
- (NSDictionary *)registTheme; // 子类注册主题
@end

@interface AGScrollTheme : NSObject <AGScrollThemeDelegate>

@property (nonatomic, strong) NSDictionary *themeDic;

+ (instancetype)defaultTheme; // 默认主题

- (NSDictionary *)defaultThemeDictionary;

- (CGFloat)menuViewHeight;
- (UIColor *)menuViewBGColor;

- (CGFloat)menuTitleViewHeight;
- (UIEdgeInsets)menuTitleViewMargin;

- (UIFont *)menuTitleNormalFont;
- (UIFont *)menuTitleHighlightedFont;
- (UIColor *)menuTitleNormalColor;
- (UIColor *)menuTitleHightlightedColor;
- (CGFloat)menuTitleHorizonSpacing;

- (CGFloat)menuScrollLineBeyondWidth;
- (CGFloat)menuScrollLineHeight;
- (UIColor *)menuScrollLineColor;

- (CGFloat)menuBottomLineHeight;
- (UIColor *)menuBottomLineColor;

@end
