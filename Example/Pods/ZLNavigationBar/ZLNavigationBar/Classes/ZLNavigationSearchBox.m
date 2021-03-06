//
//  ZLNavigationSearchBox.m
//  ZLNavigationBar
//
//  Created by zhaolei on 2018/12/28.
//

#import "ZLNavigationSearchBox.h"
#import "ZLNavigationBarPrivateHeader.h"
#import "ZLAppearanceManager.h"

@interface ZLNavigationSearchBox ()<UITextFieldDelegate>

{
    ///工具条
    UIView *_inputAccessoryView;
    ///确定按钮
    UIButton *_doneButton;
};

///上一次输入的内容
@property (nonatomic,strong) NSString *lastText;
///父视图的点击事件
@property (nonatomic,strong) UITapGestureRecognizer *superViewTap;

@end

@implementation ZLNavigationSearchBox

- (void)dealloc {
    if (self.superViewTap) {
        [self.superview removeGestureRecognizer:self.superViewTap];
        self.superViewTap = nil;
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.whiteColor;
        self.textColor = ZL_Text_Black_color;
        NSMutableAttributedString *attrM = [[NSMutableAttributedString alloc] initWithString:@"请输入关键字"];
        [attrM addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0] range:NSMakeRange(0, attrM.string.length)];
        [attrM addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithWhite:155.0 / 255.0 alpha:1.0] range:NSMakeRange(0, attrM.string.length)];
        self.attributedPlaceholder = attrM;
        self.font = [UIFont systemFontOfSize:14.0];
        self.delegate = self;
        self.returnKeyType = UIReturnKeySearch;
        [self addTarget:self action:@selector(didChangeText:) forControlEvents:(UIControlEventEditingChanged)];
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.layer.cornerRadius = CGRectGetHeight(self.frame) / 2;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = ZL_line_color.CGColor;
        self.layer.borderWidth = ZL_Line_Size_Height;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36.0, self.bounds.size.height)];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(6.0, 0, 30.0, self.bounds.size.height)];
        NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
        NSString *path = [currentBundle.resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"ZLNavigationBar.bundle/ZLNavigationBar_search@%dx.png",(int)UIScreen.mainScreen.scale]];
        [button setImage:[UIImage imageWithContentsOfFile:path] forState:UIControlStateNormal];
        button.userInteractionEnabled = NO;
        [view addSubview:button];
        self.leftView = view;
        self.leftViewMode = UITextFieldViewModeAlways;
        [self fixAppearance];
    }
    return self;
}

#pragma mark - Set
- (void)setClick:(void (^)(void))click {
    _click = click;
    if (click) {
        if (!self.superViewTap) {
            self.superViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction)];
        }
        self.userInteractionEnabled = NO;
        [self.superview addGestureRecognizer:self.superViewTap];
    }else {
        self.userInteractionEnabled = YES;
        [self.superview removeGestureRecognizer:self.superViewTap];
    }
}

#pragma mark - Lazy
- (UIView *)inputAccessoryView {
    if (!_inputAccessoryView) {
        UIView *inputAccessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ZL_Screen_Size.width, ZL_Action_Bar_Height)];
        inputAccessoryView.backgroundColor = UIColor.whiteColor;
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, ZL_Screen_Size.width, ZL_Line_Size_Height);
        layer.backgroundColor = ZL_line_color.CGColor;
        [inputAccessoryView.layer addSublayer:layer];
        _inputAccessoryView = inputAccessoryView;
        [self doneButton];
    }
    return _inputAccessoryView;
}
- (UIButton *)doneButton {
    if (!_doneButton) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.inputAccessoryView.frame.size.width - ZL_Item_Size_Width * 1.2, 0, ZL_Item_Size_Width * 1.2, self.inputAccessoryView.frame.size.height)];
        [button setTitle:@"完成" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [button setTitleColor:ZL_Text_Black_color forState:UIControlStateNormal];
        [button addTarget:self action:@selector(doneAction) forControlEvents:UIControlEventTouchUpInside];
        [self.inputAccessoryView addSubview:button];
        _doneButton = button;
    }
    return _doneButton;
}

#pragma mark - Action
- (void)doneAction {
    [self endEditing:NO];
    if (self.sureSearch) {
        self.sureSearch(self.text);
    }
}
- (void)didChangeText:(UITextField *)textField {
    if (![textField.text isEqualToString:self.lastText]) {
        if (self.realtimeSearch) {
            self.realtimeSearch(textField.text);
        }
        self.lastText = textField.text;
    }
}
- (void)clickAction {
    if (self.click) {
        self.click();
    }
}
- (void)fixAppearance {
    if ([ZLAppearanceManager shared].boxRoundLineWidth) {
        self.layer.borderWidth = [ZLAppearanceManager shared].boxRoundLineWidth;
    }
    if ([ZLAppearanceManager shared].boxRoundLineColor) {
        self.layer.borderColor = [ZLAppearanceManager shared].boxRoundLineColor.CGColor;
    }
    if ([ZLAppearanceManager shared].boxCornerRadius) {
        self.layer.cornerRadius = [ZLAppearanceManager shared].boxCornerRadius;
    }
    if ([ZLAppearanceManager shared].boxBackgroundColor) {
        self.backgroundColor = [ZLAppearanceManager shared].boxBackgroundColor;
    }
    if ([ZLAppearanceManager shared].boxAttributedPlaceholder) {
        self.attributedPlaceholder = [ZLAppearanceManager shared].boxAttributedPlaceholder;
    }
    if ([ZLAppearanceManager shared].boxTextFont) {
        self.font = [ZLAppearanceManager shared].boxTextFont;
    }
    if ([ZLAppearanceManager shared].boxTextColor) {
        self.textColor = [ZLAppearanceManager shared].boxTextColor;
    }
    if ([ZLAppearanceManager shared].boxAttributedText) {
        self.attributedText = [ZLAppearanceManager shared].boxAttributedText;
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:NO];
    if (self.sureSearch) {
        self.sureSearch(textField.text);
    }
    return YES;
}

@end
