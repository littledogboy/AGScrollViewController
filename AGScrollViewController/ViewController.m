//
//  ViewController.m
//  AGScrollViewController
//
//  Created by 吴书敏 on 2018/4/11.
//  Copyright © 2018年 吴书敏. All rights reserved.
//

#import "ViewController.h"
#import "AGScrollViewController.h"
#import "AGScrollTheme.h"
#import "FanScrollTheme.h"
#import "MyScrollMemuTitleCell.h"
#import <Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) AGScrollMenuView *menuView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self testMenuView];
    [self testAGScrollVC];
}

- (void)testMenuView {
    self.menuView = [[AGScrollMenuView alloc] initWithFrame:CGRectZero scrollTheme:[AGScrollTheme defaultTheme]];
    [self.view addSubview:self.menuView];
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(100);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(41);
    }];
    
    self.menuView.menuTitles = @[@"推荐", @"护肤", @"套装", @"小众", @"美妆直通车", @"衣服", @"鞋子", @"那兔那年那些事情啊啊啊啊啊啊啊啊"];
}

- (void)testAGScrollVC {
    NSArray *titles = @[@"推荐", @"护肤", @"套装", @"小众", @"美妆直通车", @"衣服", @"鞋子", @"那兔那年那些事情啊啊啊啊啊啊啊啊"];
    NSMutableArray *vcs = [NSMutableArray array];
    for (int i = 0; i < titles.count; i++) {
        CGFloat r = (arc4random() % 11) / 10.0;
        CGFloat g = (arc4random() % 11) / 10.0;
        CGFloat b = (arc4random() % 11) / 10.0;
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
        [vcs addObject:vc];
    }
//    AGScrollTheme *theme = [AGScrollTheme defaultTheme];
    FanScrollTheme *theme = [[FanScrollTheme alloc] init];
    AGScrollViewController *scrollVC = [[AGScrollViewController alloc] init];
    scrollVC.scrollTheme = theme;
    scrollVC.menuTitles = titles;
    scrollVC.viewControllers = vcs;
    [scrollVC registMenuCell:[MyScrollMemuTitleCell class]];
    [self.view addSubview:scrollVC.view];
    [self addChildViewController:scrollVC];

    
    [scrollVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(64);
        make.left.right.mas_equalTo(self.view);
        if (@available(iOS 11, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
    }];
}





@end
