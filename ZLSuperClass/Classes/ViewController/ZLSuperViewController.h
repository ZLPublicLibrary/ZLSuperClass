//
//  ZLSuperViewController.h
//  BasicProduct
//
//  Created by 赵磊 on 2021/2/18.
//  Copyright © 2021 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZLNavigationBar/ZLNavigationBar.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLSuperViewController : UIViewController

///主键id
@property (nonatomic,strong,nullable) NSString *keyID;
///其他附加的参数
@property (nonatomic,strong,nullable) NSDictionary *otherParams;
///导航条
@property (nonatomic,strong) ZLNavigationBar *navBar;

@end

NS_ASSUME_NONNULL_END
