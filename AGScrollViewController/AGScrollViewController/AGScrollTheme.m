//
//  AGScrollTheme.m
//  AGScrollViewController
//
//  Created by 吴书敏 on 2018/4/11.
//  Copyright © 2018年 吴书敏. All rights reserved.
//

#import "AGScrollTheme.h"

NSString * const kAGScrollThemeDefaultMenuViewHeight = @"kAGScrollThemeDefaultMenuViewHeight";
NSString * const kAGScrollThemeDefaultMenuViewBGColor = @"kAGScrollThemeDefaultMenuViewBGColor";

NSString * const kAGScrollThemeDefaultMenuTitleViewMargin = @"kAGScrollThemeDefaultMenuTitleViewMargin";
NSString * const kAGScrollThemeDefaultMenuTitleViewHeight = @"kAGScrollThemeDefaultMenuTitleViewHeight";

NSString * const kAGScrollThemeDefaultMenuTitleNormalFont = @"kAGScrollThemeDefaultMenuTitleNormalFont";
NSString * const kAGScrollThemeDefaultMenuTitleHighlightedFont = @"kAGScrollThemeDefaultMenuTitleHighlightedFont";
NSString * const kAGScrollThemeDefaultMenuTitleNormalColor = @"kAGScrollThemeDefaultMenuTitleNormalColor";
NSString * const kAGScrollThemeDefaultMenuTitleHighlightedColor = @"kAGScrollThemeDefaultMenuTitleHighlightedColor";

NSString * const kAGScrollThemeDefaultMenuTitleHorizonSpacing = @"kAGScrollThemeDefaultMenuTitleHorizonSpacing";

NSString * const kAGScrollThemeDefaultMenuScrollLineBeyondWidth = @"kAGScrollThemeDefaultMenuScrollLineBeyondWidth";
NSString * const kAGScrollThemeDefaultMenuScrollLineHeight = @"kAGScrollThemeDefaultMenuScrollLineHeight";
NSString * const kAGScrollThemeDefaultMenuScrollLineColor = @"kAGScrollThemeDefaultMenuScrollLineColor";

NSString * const kAGScrollThemeDefaultMenuBottomLineHeight = @"kAGScrollThemeDefaultMenuBottomLineHeight";
NSString * const kAGScrollThemeDefaultMenuBottomLineColor = @"kAGScrollThemeDefaultMenuBottomLineColor";


@interface AGScrollTheme () 

@property (nonatomic, weak) id <AGScrollThemeDelegate> delegate;

@end

#pragma clang diagnostic puch
#pragma clang diagnostic ignored "-Wprotocol"
@implementation AGScrollTheme
#pragma clang disgnostic pop

+ (instancetype)defaultTheme {
    return [[AGScrollTheme alloc] init];
}


- (instancetype)init {
    self = [super init];
    if (self) {
        self.delegate = self;
        if (self.delegate && [self.delegate respondsToSelector:@selector(registTheme)]) {
            self.themeDic = [self configTheme];
        } else {
            self.themeDic = [self defaultThemeDictionary];
        }
    }
    return self;
}

- (NSDictionary *)configTheme {
    return [self.delegate registTheme];
}

// 默认主题
- (NSDictionary *)defaultThemeDictionary {
    return @{
             kAGScrollThemeDefaultMenuViewHeight : @(41),
             kAGScrollThemeDefaultMenuViewBGColor : [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1],
             
             kAGScrollThemeDefaultMenuTitleViewMargin : [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(16, 22, 12, 22)],
             kAGScrollThemeDefaultMenuTitleViewHeight : @(13),
             
             kAGScrollThemeDefaultMenuTitleNormalFont : [UIFont fontWithName:@"PingFangSC-Regular" size:14],
             kAGScrollThemeDefaultMenuTitleHighlightedFont : [UIFont fontWithName:@"PingFangSC-Semibold" size:14],
             kAGScrollThemeDefaultMenuTitleNormalColor : [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1],
             kAGScrollThemeDefaultMenuTitleHighlightedColor : [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1],
             kAGScrollThemeDefaultMenuTitleHorizonSpacing : @(30),
             
             kAGScrollThemeDefaultMenuScrollLineBeyondWidth : @(9),
             kAGScrollThemeDefaultMenuScrollLineHeight : @(2),
             kAGScrollThemeDefaultMenuScrollLineColor : [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1],
             
             kAGScrollThemeDefaultMenuBottomLineHeight : @(1),
             kAGScrollThemeDefaultMenuBottomLineColor : [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1],
             };
}

- (CGFloat)menuViewHeight {
    return [[self.themeDic objectForKey:kAGScrollThemeDefaultMenuViewHeight] floatValue];
}

- (UIColor *)menuViewBGColor {
    return [self.themeDic objectForKey:kAGScrollThemeDefaultMenuViewBGColor];
}


- (CGFloat)menuTitleViewHeight {
    return [[self.themeDic objectForKey:kAGScrollThemeDefaultMenuTitleViewHeight] floatValue];
}

- (UIEdgeInsets)menuTitleViewMargin {
    return [[self.themeDic objectForKey:kAGScrollThemeDefaultMenuTitleViewMargin] UIEdgeInsetsValue];
}

- (UIFont *)menuTitleNormalFont {
    return [self.themeDic objectForKey:kAGScrollThemeDefaultMenuTitleNormalFont];
}

- (UIFont *)menuTitleHighlightedFont {
    return [self.themeDic objectForKey:kAGScrollThemeDefaultMenuTitleHighlightedFont];
}

- (UIColor *)menuTitleNormalColor {
    return [self.themeDic objectForKey:kAGScrollThemeDefaultMenuTitleNormalColor];
}

- (UIColor *)menuTitleHightlightedColor {
    return [self.themeDic objectForKey:kAGScrollThemeDefaultMenuTitleHighlightedColor];
}

- (CGFloat)menuTitleHorizonSpacing {
    return [[self.themeDic objectForKey:kAGScrollThemeDefaultMenuTitleHorizonSpacing] floatValue];
}

- (CGFloat)menuScrollLineBeyondWidth {
    return [[self.themeDic objectForKey:kAGScrollThemeDefaultMenuScrollLineBeyondWidth] floatValue];
}

- (CGFloat)menuScrollLineHeight {
    return [[self.themeDic objectForKey:kAGScrollThemeDefaultMenuScrollLineHeight] floatValue];
}

- (UIColor *)menuScrollLineColor {
    return [self.themeDic objectForKey:kAGScrollThemeDefaultMenuScrollLineColor];
}

- (CGFloat)menuBottomLineHeight {
    return [[self.themeDic objectForKey:kAGScrollThemeDefaultMenuBottomLineHeight] floatValue];
}

- (UIColor *)menuBottomLineColor {
    return [self.themeDic objectForKey:kAGScrollThemeDefaultMenuBottomLineColor];
}
@end
