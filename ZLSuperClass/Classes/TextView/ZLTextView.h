//
//  ZLTextView.h
//  ZLSuperClass_Example
//
//  Created by 赵磊 on 2021/2/22.
//  Copyright © 2021 itzhaolei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLTextView : UITextView

///占位
@property (nonatomic,strong) NSString *placeholder;

///占位
@property (nonatomic,weak) UILabel *placeholderLabel;
///确定按钮
@property (nonatomic,weak,readonly) UIButton *doneButton;

///确定
@property (nonatomic,copy) void (^done)(NSString *text);
///实时监测文字
@property (nonatomic,copy) void (^change)(NSString *text);

@end

NS_ASSUME_NONNULL_END
