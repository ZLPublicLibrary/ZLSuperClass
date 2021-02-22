//
//  UIImage+ZLLoadPath.m
//  ZLSuperClass_Example
//
//  Created by 赵磊 on 2021/2/22.
//  Copyright © 2021 itzhaolei. All rights reserved.
//

#import "UIImage+ZLLoadPath.h"

@implementation UIImage (ZLLoadPath)

/** 加载某个组件里的图片（双倍图）
 * pathName 图片名称（不要后缀，例如：icon@2x.png 只需要传入 icon ）
 * class 通过哪个类加载当前的Bundle
 * bundleName 资源Bundle的Bundle名
 */
+ (UIImage *)imageWithPathDoubleName:(NSString *)pathName BundleForClass:(Class)class BundleName:(NSString *)bundleName {
    NSBundle *bundle = [NSBundle bundleForClass:class];
    NSURL *url = [bundle URLForResource:bundleName withExtension:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithURL:url];
    NSString *imageName = pathName;
    NSString *path = [resourceBundle.bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@@%dx.png", imageName, (int)UIScreen.mainScreen.scale]];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    if (!image) {
        image = [UIImage imageNamed:imageName];
    }
    return image;
}

/** 加载某个组件里的图片（单倍图）
 * pathName 图片名称（需要传入全名称 例如：icon.png 需要传入 icon.png ）
 * class 通过哪个类加载当前的Bundle
 * bundleName 资源Bundle的Bundle名
 */
+ (UIImage *)imageWithPathSingleName:(NSString *)pathName BundleForClass:(Class)class BundleName:(NSString *)bundleName {
    NSBundle *bundle = [NSBundle bundleForClass:class];
    NSURL *url = [bundle URLForResource:bundleName withExtension:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithURL:url];
    NSString *imageName = pathName;
    NSString *path = [resourceBundle.bundlePath stringByAppendingPathComponent:imageName];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    if (!image) {
        image = [UIImage imageNamed:imageName];
    }
    return image;
}


@end
