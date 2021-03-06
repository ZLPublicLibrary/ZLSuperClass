//
//  ZLCollectionView.m
//  ZLSupers_Example
//
//  Created by 赵磊 on 2021/2/22.
//  Copyright © 2021 itzhaolei. All rights reserved.
//

#import "ZLCollectionView.h"

@implementation ZLCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.alwaysBounceVertical = YES;
        self.backgroundColor = UIColor.whiteColor;
        //ios11 适配
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            self.scrollIndicatorInsets = self.contentInset;
        }
    }
    return self;
}

@end
