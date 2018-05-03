//
//  FanScrollTheme.m
//  AGScrollViewController
//
//  Created by 吴书敏 on 2018/4/12.
//  Copyright © 2018年 吴书敏. All rights reserved.
//

#import "FanScrollTheme.h"

@implementation FanScrollTheme

- (NSDictionary *)registTheme {
    return @{
             kAGScrollThemeDefaultMenuViewHeight : @(41),
             kAGScrollThemeDefaultMenuViewBGColor : [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1],
             
             kAGScrollThemeDefaultMenuTitleViewMargin : [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(16, 0, 12, 0)],
             kAGScrollThemeDefaultMenuTitleViewHeight : @(13),
             
             kAGScrollThemeDefaultMenuTitleNormalFont : [UIFont fontWithName:@"PingFangSC-Regular" size:14],
             kAGScrollThemeDefaultMenuTitleHighlightedFont : [UIFont fontWithName:@"PingFangSC-Semibold" size:14],
             kAGScrollThemeDefaultMenuTitleNormalColor : [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1],
             kAGScrollThemeDefaultMenuTitleHighlightedColor : [UIColor redColor],
             kAGScrollThemeDefaultMenuTitleHorizonSpacing : @(30),
             
             kAGScrollThemeDefaultMenuScrollLineBeyondWidth : @(9),
             kAGScrollThemeDefaultMenuScrollLineHeight : @(2),
             kAGScrollThemeDefaultMenuScrollLineColor : [UIColor redColor],
             
             kAGScrollThemeDefaultMenuBottomLineHeight : @(1),
             kAGScrollThemeDefaultMenuBottomLineColor : [UIColor redColor],
             };
}

@end
