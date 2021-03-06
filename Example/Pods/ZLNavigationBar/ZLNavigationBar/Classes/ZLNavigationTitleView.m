//
//  ZLNavigationTitleView.m
//  ZLNavigationBar
//
//  Created by zhaolei on 2018/12/28.
//

#import "ZLNavigationTitleView.h"
#import "ZLNavigationBarPrivateHeader.h"
#import "ZLAppearanceManager.h"

@interface ZLNavigationTitleView ()

{
    ///标题视图
    UILabel *_titleLabel;
    ///搜索框
    ZLNavigationSearchBox *_searchBox;
};

///是否已经加载标题视图
@property (nonatomic,unsafe_unretained) BOOL didLoadTitleLabel;
///是否已经加载搜索框
@property (nonatomic,unsafe_unretained) BOOL didLoadSearchBox;

@end

@implementation ZLNavigationTitleView

#pragma mark - Set
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (self.didLoadTitleLabel) {
        self.titleLabel.frame = self.bounds;
    }
    if (self.didLoadSearchBox) {
        self.searchBox.frame = self.bounds;
    }
}
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

#pragma mark - Lazy
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = UIColor.blackColor;
        label.font = [UIFont systemFontOfSize:18.0];
        if ([ZLAppearanceManager shared].titleFont) {
            label.font = [ZLAppearanceManager shared].titleFont;
        }
        if ([ZLAppearanceManager shared].titleColor) {
            label.textColor = [ZLAppearanceManager shared].titleColor;
        }
        if ([ZLAppearanceManager shared].attributedTitle) {
            label.attributedText = [ZLAppearanceManager shared].attributedTitle;
        }
        self.didLoadTitleLabel = YES;
        [self addSubview:label];
        _titleLabel = label;
    }
    return _titleLabel;
}
- (ZLNavigationSearchBox *)searchBox {
    if (!_searchBox) {
        ZLNavigationSearchBox *textField = [[ZLNavigationSearchBox alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        self.didLoadSearchBox = YES;
        [self addSubview:textField];
        _searchBox = textField;
    }
    return _searchBox;
}

@end
