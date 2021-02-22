//
//  ZLButton.h
//  ZLSuperClass_Example
//
//  Created by 赵磊 on 2021/2/22.
//  Copyright © 2021 itzhaolei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLButton : UIButton

///点击事件
@property (nonatomic, copy, nullable) void (^touchUpInside)(ZLButton *This);

/** 设置背景颜色
 */
- (void)setBackgroundColor:(nullable UI_APPEARANCE_SELECTOR UIColor *)color forState:(UIControlState)state;

/** 设置描边颜色
 */
- (void)setBorderColor:(nullable UI_APPEARANCE_SELECTOR UIColor *)color forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
