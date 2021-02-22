//
//  ZLTextField.h
//  ZLSuperClass_Example
//
//  Created by 赵磊 on 2021/2/22.
//  Copyright © 2021 itzhaolei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLTextField : UITextField

///确定按钮
@property (nonatomic,weak,readonly) UIButton *doneButton;
///确定
@property (nonatomic,copy) void (^done)(NSString *text);
///最大长度
@property (nonatomic,unsafe_unretained) NSInteger maxLenght;
///仅支持数字和字母
@property (nonatomic,unsafe_unretained) BOOL banPunctuation;

@end

NS_ASSUME_NONNULL_END
