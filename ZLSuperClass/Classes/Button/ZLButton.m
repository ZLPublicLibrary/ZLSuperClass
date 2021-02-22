//
//  ZLButton.m
//  ZLSuperClass_Example
//
//  Created by 赵磊 on 2021/2/22.
//  Copyright © 2021 itzhaolei. All rights reserved.
//

#import "ZLButton.h"

@interface ZLButton ()

{
    ///默认的背景颜色
    UIColor * _normalBackgroundColor;
    ///不能点击的背景颜色
    UIColor * _disabledBackgroundColor;
    ///选中的背景颜色
    UIColor * _selectedBackgroundColor;
    ///默认的描边颜色
    UIColor * _normalBorderColor;
    ///不能点击的描边颜色
    UIColor * _disabledBorderColor;
    ///选中的描边颜色
    UIColor * _selectedBorderColor;
}

@end

@implementation ZLButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark - Set
- (void)setSelected:(BOOL)selected {
    super.selected = selected;
    if (_selectedBackgroundColor) {
        self.backgroundColor = selected ? _selectedBackgroundColor : _normalBackgroundColor;
    }
}
- (void)setEnabled:(BOOL)enabled {
    super.enabled = enabled;
    if (_disabledBackgroundColor) {
        self.backgroundColor = enabled ? _normalBackgroundColor : _disabledBackgroundColor;
    }
}

#pragma mark - Action
- (void)action {
    if (self.touchUpInside) {
        self.touchUpInside(self);
    }
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    if (target != self) {
        self.touchUpInside = nil;
    }
    [super addTarget:target action:action forControlEvents:controlEvents];
}

/** 设置背景颜色
 */
- (void)setBackgroundColor:(nullable UI_APPEARANCE_SELECTOR UIColor *)color forState:(UIControlState)state {
    if (state == UIControlStateNormal) {
        _normalBackgroundColor = color;
    }else if (state == UIControlStateDisabled) {
        _disabledBackgroundColor = color;
    }else if (state == UIControlStateSelected) {
        _selectedBackgroundColor = color;
    }
    self.selected = self.selected;
    self.enabled = self.enabled;
}
/** 设置描边颜色
 */
- (void)setBorderColor:(nullable UI_APPEARANCE_SELECTOR UIColor *)color forState:(UIControlState)state {
    if (state == UIControlStateNormal) {
        _normalBorderColor = color;
    }else if (state == UIControlStateDisabled) {
        _disabledBorderColor = color;
    }else if (state == UIControlStateSelected) {
        _selectedBorderColor = color;
    }
    self.selected = self.selected;
    self.enabled = self.enabled;
}

@end
