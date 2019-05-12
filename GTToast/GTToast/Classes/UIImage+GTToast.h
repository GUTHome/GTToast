//
//  UIImage+GTToast.h
//  GTToast
//
//  Created by cocomanber on 2019/5/12.
//  Copyright © 2019 cocomanber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GTToast)

/**
 根据本地GIF图片名 获得GIF image对象
 
 @param name <#name description#>
 @return <#return value description#>
 */
+ (UIImage *)gt_imageWithGIFNamed:(NSString *)name;

/**
 保持当前图片的形状不变，使用指定的颜色去重新渲染它，生成一张新图片并返回
 
 @param tintColor 要用于渲染的新颜色
 @return 与当前图片形状一致但颜色与参数tintColor相同的新图片
 */
- (UIImage *)gt_imageWithTintColor:(UIColor *)tintColor;

@end

