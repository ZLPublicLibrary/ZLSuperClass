//
//  ZLNavigationController.m
//  BasicProduct
//
//  Created by 赵磊 on 2021/2/18.
//  Copyright © 2021 赵磊. All rights reserved.
//

#import "ZLNavigationController.h"

@interface ZLNavigationController ()

@end

@implementation ZLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.hidden = YES;
    self.modalPresentationStyle = UIModalPresentationFullScreen;
}

@end
