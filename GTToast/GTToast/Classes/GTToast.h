//
//  GTToast.h
//  GTToast
//
//  Created by cocomanber on 2019/5/12.
//  Copyright © 2019 cocomanber. All rights reserved.
//
//  ******************  温馨提示  ******************
//  1、基于MBProgressHUD二次封装盒子，方便替换底层SDK。
//  2、解决MBProgressHUD显示文本长度限制问题。[GTToast showText:nil detailText:text];
//  3、新增Top、Bom、Center，三种显示风格。
//  4、利用单例GTToastManager全局样式，移步查看更多。
//  5、MB库图片大小推荐 37*37
//

#import <Foundation/Foundation.h>
#import "GTToastManager.h"

/** toast消失时的回调 */
typedef void(^GTToastDismissCompletion)(void);

@interface GTToast : NSObject

+ (void)showText:(NSString *)text;
+ (void)showText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay;
+ (void)showText:(NSString *)text detailText:(NSString *)detailText;
+ (void)showText:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay;
+ (void)showText:(NSString *)text dismissCompletion:(GTToastDismissCompletion) completionBlock;
+ (void)showText:(NSString *)text detailText:(NSString *)detailText dismissCompletion:(GTToastDismissCompletion) completionBlock;

+ (void)showInfoText:(NSString *)text;
+ (void)showInfoText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay;
+ (void)showInfoText:(NSString *)text detailText:(NSString *)detailText;
+ (void)showInfoText:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay;
+ (void)showInfoText:(NSString *)text dismissCompletion:(GTToastDismissCompletion) completionBlock;
+ (void)showInfoText:(NSString *)text detailText:(NSString *)detailText dismissCompletion:(GTToastDismissCompletion) completionBlock;

+ (void)showErrorText:(NSString *)text;
+ (void)showErrorText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay;
+ (void)showErrorText:(NSString *)text detailText:(NSString *)detailText;
+ (void)showErrorText:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay;
+ (void)showErrorText:(NSString *)text dismissCompletion:(GTToastDismissCompletion) completionBlock;
+ (void)showErrorText:(NSString *)text detailText:(NSString *)detailText dismissCompletion:(GTToastDismissCompletion) completionBlock;

+ (void)showSuccessText:(NSString *)text;
+ (void)showSuccessText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay;
+ (void)showSuccessText:(NSString *)text detailText:(NSString *)detailText;
+ (void)showSuccessText:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay;
+ (void)showSuccessText:(NSString *)text dismissCompletion:(GTToastDismissCompletion) completionBlock;
+ (void)showSuccessText:(NSString *)text detailText:(NSString *)detailText dismissCompletion:(GTToastDismissCompletion) completionBlock;

+ (void)showText:(NSString *)text image:(UIImage *)image;
+ (void)showText:(NSString *)text image:(UIImage *)image hideAfterDelay:(NSTimeInterval)delay;
+ (void)showText:(NSString *)text image:(UIImage *)image dismissCompletion:(GTToastDismissCompletion) completionBlock;

+ (void)showLoading;
+ (void)showLoadingHideAfterDelay:(NSTimeInterval)delay;
+ (void)showLoadingText:(NSString *)text;
+ (void)showLoadingText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay;
+ (void)showLoadingText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay dismissCompletion:(GTToastDismissCompletion) completionBlock;

/// 未实现
+ (void)showProgress:(CGFloat)progress;
+ (void)showProgress:(CGFloat)progress Text:(NSString *)text;
+ (void)showProgress:(CGFloat)progress Text:(NSString *)text dismissCompletion:(GTToastDismissCompletion) completionBlock;

/** 展示超长文本：传时间则按照时间显示，不传内部计算显示时间 */
+ (void)showAllText:(NSString *)text;
+ (void)showAllText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay;
+ (void)showAllText:(NSString *)text dismissCompletion:(GTToastDismissCompletion) completionBlock;

/** 网络统一请求时loading，待补充gif */
+ (void)loading;

/** hidden */
+ (void)hidden;

@end


