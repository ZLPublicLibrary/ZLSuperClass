//
//  ZLSuperViewController.m
//  BasicProduct
//
//  Created by 赵磊 on 2021/2/18.
//  Copyright © 2021 赵磊. All rights reserved.
//

#import "ZLSuperViewController.h"

@interface ZLSuperViewController ()

@end

@implementation ZLSuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
}

#pragma mark - Lazy
- (ZLNavigationBar *)navBar {
    if (!_navBar) {
        ZLNavigationBar *navBar = [ZLNavigationBar navigationBar];
        [self.view addSubview:navBar];
        _navBar = navBar;
    }
    return _navBar;
}

#pragma mark - Action
///关闭当前视图
- (void)goback {
    if (self.navigationController.viewControllers.firstObject == self) {
        [self dismissViewControllerAnimated:YES completion:nil];
        return ;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
