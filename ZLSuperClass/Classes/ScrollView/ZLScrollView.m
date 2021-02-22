//
//  ZLScrollView.m
//  ZLSupers_Example
//
//  Created by 赵磊 on 2021/2/22.
//  Copyright © 2021 itzhaolei. All rights reserved.
//

#import "ZLScrollView.h"

@implementation ZLScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.alwaysBounceVertical = YES;
        self.contentSize = self.bounds.size;
        self.backgroundColor = UIColor.whiteColor;
        //ios11 适配
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            self.scrollIndicatorInsets = self.contentInset;
        }
    }
    return self;
}

#pragma mark - Set
- (void)setContentSize:(CGSize)contentSize {
    super.contentSize = contentSize;
    self.contentView.frame = CGRectMake(0, 0, contentSize.width, contentSize.height);
}

#pragma mark - Lazy
- (UIView *)contentView {
    if (!_contentView) {
        UIView *view = [[UIView alloc] initWithFrame:self.bounds];
        view.backgroundColor = UIColor.whiteColor;
        [self addSubview:view];
        _contentView = view;
    }
    return _contentView;
}

@end
