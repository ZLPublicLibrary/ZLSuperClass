//
//  UIImage+ZLLoadPath.h
//  ZLSuperClass_Example
//
//  Created by 赵磊 on 2021/2/22.
//  Copyright © 2021 itzhaolei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ZLLoadPath)


/** 加载某个组件里的图片（双倍图）
 * pathName 图片名称（不要后缀，例如：icon@2x.png 只需要传入 icon ）
 * class 通过哪个类加载当前的Bundle
 * bundleName 资源Bundle的Bundle名
 */
+ (UIImage *)imageWithPathDoubleName:(NSString *)pathName BundleForClass:(Class)class BundleName:(NSString *)bundleName;


/** 加载某个组件里的图片（单倍图）
 * pathName 图片名称（需要传入全名称 例如：icon.png 需要传入 icon.png ）
 * class 通过哪个类加载当前的Bundle
 * bundleName 资源Bundle的Bundle名
 */
+ (UIImage *)imageWithPathSingleName:(NSString *)pathName BundleForClass:(Class)class BundleName:(NSString *)bundleName;


@end

NS_ASSUME_NONNULL_END
