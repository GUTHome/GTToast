//
//  GTToast.m
//  GTToast
//
//  Created by cocomanber on 2019/5/12.
//  Copyright © 2019 cocomanber. All rights reserved.
//

#import "GTToast.h"
#import "UIImage+GTToast.h"
#import <MBProgressHUD/MBProgressHUD.h>

#define kDefaultDuration [GTToastManager shareInstance].defaultDuration

@implementation GTToast

/** 文本 */
+ (void)showText:(NSString *)text{
    [GTToast showText:text hideAfterDelay:kDefaultDuration];
}

+ (void)showText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay{
    [GTToast showText:text detailText:nil hideAfterDelay:delay];
}

+ (void)showText:(NSString *)text dismissCompletion:(GTToastDismissCompletion) completionBlock{
    [GTToast showText:text detailText:nil dismissCompletion:completionBlock];
}

+ (void)showText:(NSString *)text detailText:(NSString *)detailText{
    [GTToast showText:text detailText:detailText hideAfterDelay:kDefaultDuration];
}

+ (void)showText:(NSString *)text detailText:(NSString *)detailText dismissCompletion:(GTToastDismissCompletion) completionBlock{
    [GTToast showText:text detailText:detailText hideAfterDelay:kDefaultDuration dismissCompletion:completionBlock];
}

+ (void)showText:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay{
    [GTToast showText:text detailText:detailText hideAfterDelay:kDefaultDuration dismissCompletion:nil];
}

+ (void)showText:(NSString *)text
      detailText:(NSString *)detailText
  hideAfterDelay:(NSTimeInterval)delay
dismissCompletion:(GTToastDismissCompletion) completionBlock
{
    
    if (![GTToast checkValid]) {
        return;
    }
    UIView *view = [GTToastManager shareInstance].sharedView;
    
    if (text.length <= 0 || !text) {
        return;
    }
    
    CGFloat verticalOffset = [GTToastManager shareInstance].centreOffset;
    if ([GTToastManager shareInstance].toastPosition == GTToastPositionTop) {
        verticalOffset = [GTToastManager shareInstance].topOffset;
    }else if ([GTToastManager shareInstance].toastPosition == GTToastPositionBottom){
        verticalOffset = [GTToastManager shareInstance].bomttomOffset;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.label.font = [GTToastManager shareInstance].textFont;
    hud.label.textColor = [GTToastManager shareInstance].textColor;
    if (detailText && detailText.length > 0) {
        hud.detailsLabel.text = detailText;
        hud.detailsLabel.font = [GTToastManager shareInstance].detailTextFont;
        hud.detailsLabel.textColor = [GTToastManager shareInstance].detailTextColor;
    }
    hud.contentColor = [GTToastManager shareInstance].textColor;
    hud.bezelView.backgroundColor = [GTToastManager shareInstance].backgroundColor;
    hud.offset = CGPointMake(0, verticalOffset);
    hud.userInteractionEnabled = ![GTToastManager shareInstance].userCanTouchView;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:delay];
    hud.completionBlock = ^{
        if (completionBlock) {
            completionBlock();
        }
    };
}

/** info */
+ (void)showInfoText:(NSString *)text{
    [GTToast showInfoText:text detailText:nil];
}

+ (void)showInfoText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay{
    [GTToast showInfoText:text detailText:nil hideAfterDelay:delay];
}

+ (void)showInfoText:(NSString *)text detailText:(NSString *)detailText{
    [GTToast showInfoText:text detailText:detailText hideAfterDelay:kDefaultDuration];
}

+ (void)showInfoText:(NSString *)text dismissCompletion:(GTToastDismissCompletion) completionBlock{
    [GTToast showText:text detailText:nil dismissCompletion:completionBlock];
}

+ (void)showInfoText:(NSString *)text detailText:(NSString *)detailText dismissCompletion:(GTToastDismissCompletion) completionBlock{
    [GTToast showAllType:0 text:text detailText:detailText hideAfterDelay:kDefaultDuration dismissCompletion:completionBlock];
}

+ (void)showInfoText:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay{
    [GTToast showAllType:0 text:text detailText:detailText hideAfterDelay:delay dismissCompletion:nil];
}

/** error */
+ (void)showErrorText:(NSString *)text{
    [GTToast showErrorText:text detailText:nil];
}

+ (void)showErrorText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay{
    [GTToast showErrorText:text detailText:nil hideAfterDelay:delay];
}

+ (void)showErrorText:(NSString *)text detailText:(NSString *)detailText{
    [GTToast showErrorText:text detailText:detailText hideAfterDelay:kDefaultDuration];
}

+ (void)showErrorText:(NSString *)text dismissCompletion:(GTToastDismissCompletion) completionBlock{
    [GTToast showErrorText:text detailText:nil dismissCompletion:completionBlock];
}

+ (void)showErrorText:(NSString *)text detailText:(NSString *)detailText dismissCompletion:(GTToastDismissCompletion) completionBlock{
    [GTToast showAllType:1 text:text detailText:detailText hideAfterDelay:kDefaultDuration dismissCompletion:completionBlock];
}

+ (void)showErrorText:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay{
    [GTToast showAllType:1 text:text detailText:detailText hideAfterDelay:delay dismissCompletion:nil];
}

/** success */
+ (void)showSuccessText:(NSString *)text{
    [GTToast showSuccessText:text detailText:nil];
}

+ (void)showSuccessText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay{
    [GTToast showSuccessText:text detailText:nil hideAfterDelay:delay];
}

+ (void)showSuccessText:(NSString *)text detailText:(NSString *)detailText{
    [GTToast showSuccessText:text detailText:detailText hideAfterDelay:kDefaultDuration];
}

+ (void)showSuccessText:(NSString *)text dismissCompletion:(GTToastDismissCompletion) completionBlock{
    [GTToast showSuccessText:text detailText:nil dismissCompletion:completionBlock];
}

+ (void)showSuccessText:(NSString *)text detailText:(NSString *)detailText dismissCompletion:(GTToastDismissCompletion) completionBlock{
    [GTToast showAllType:2 text:text detailText:detailText hideAfterDelay:kDefaultDuration dismissCompletion:completionBlock];
}

+ (void)showSuccessText:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay{
    [GTToast showAllType:2 text:text detailText:detailText hideAfterDelay:delay dismissCompletion:nil];
}

/// Info、error、success类型的入口
/// 规定Info_type = 0, error_type = 1, success_type = 2,
+ (void)showAllType:(NSInteger)type
               text:(NSString *)text
         detailText:(NSString *)detailText
     hideAfterDelay:(NSTimeInterval)delay
  dismissCompletion:(GTToastDismissCompletion) completionBlock
{
    if (![GTToast checkValid]) {
        return;
    }
    
    NSString *icon = nil;
    switch (type) {
        case 0:
            icon = @"gt_info";
            break;
        case 1:
            icon = @"gt_error";
            break;
        case 2:
            icon = @"gt_done";
            break;
        default:
            break;
    }
    
    NSString *bundle_path = [[NSBundle mainBundle] pathForResource:@"GTToast" ofType:@"bundle"];
    NSBundle *gtBundle = [NSBundle bundleWithPath:bundle_path];
    NSString *type_path = [[gtBundle resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", icon]];
    if (!type_path) {
        return;
    }
    UIView *view = [GTToastManager shareInstance].sharedView;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:type_path]];
    hud.label.text = text;
    hud.label.font = [GTToastManager shareInstance].textFont;
    hud.label.textColor = [GTToastManager shareInstance].textColor;
    if (detailText && detailText.length > 0) {
        hud.detailsLabel.text = detailText;
        hud.detailsLabel.font = [GTToastManager shareInstance].detailTextFont;
        hud.detailsLabel.textColor = [GTToastManager shareInstance].detailTextColor;
    }
    hud.contentColor = [GTToastManager shareInstance].textColor;
    hud.bezelView.backgroundColor = [GTToastManager shareInstance].backgroundColor;
    hud.userInteractionEnabled = ![GTToastManager shareInstance].userCanTouchView;
    hud.removeFromSuperViewOnHide = YES;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:delay];
    hud.completionBlock = ^{
        if (completionBlock) {
            completionBlock();
        }
    };
}

/** image 37x37 */
+ (void)showText:(NSString *)text image:(UIImage *)image{
    [GTToast showText:text image:image hideAfterDelay:kDefaultDuration];
}

+ (void)showText:(NSString *)text image:(UIImage *)image hideAfterDelay:(NSTimeInterval)delay{
    [GTToast showText:text image:image hideAfterDelay:delay dismissCompletion:nil];
}

+ (void)showText:(NSString *)text image:(UIImage *)image dismissCompletion:(GTToastDismissCompletion) completionBlock{
    [GTToast showText:text image:image hideAfterDelay:kDefaultDuration dismissCompletion:completionBlock];
}

+ (void)showText:(NSString *)text
           image:(UIImage *)image
  hideAfterDelay:(NSTimeInterval)delay
dismissCompletion:(GTToastDismissCompletion) completionBlock
{
    if (![GTToast checkValid]) {
        return;
    }
    UIView *view = [GTToastManager shareInstance].sharedView;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    if (image) {
        hud.customView = [[UIImageView alloc] initWithImage:image];
    }
    hud.label.text = text;
    hud.label.font = [GTToastManager shareInstance].textFont;
    hud.label.textColor = [GTToastManager shareInstance].textColor;
    hud.contentColor = [GTToastManager shareInstance].textColor;
    hud.bezelView.backgroundColor = [GTToastManager shareInstance].backgroundColor;
    hud.userInteractionEnabled = ![GTToastManager shareInstance].userCanTouchView;
    hud.removeFromSuperViewOnHide = YES;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:delay];
    hud.completionBlock = ^{
        if (completionBlock) {
            completionBlock();
        }
    };
}

/** loading */
+ (void)showLoading{
    [GTToast showLoadingHideAfterDelay:24*60*60];
}

+ (void)showLoadingHideAfterDelay:(NSTimeInterval)delay{
    [GTToast showLoadingText:nil hideAfterDelay:delay];
}

+ (void)showLoadingText:(NSString *)text{
    [GTToast showLoadingText:text hideAfterDelay:24*60*60];
}

+ (void)showLoadingText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay{
    [GTToast showLoadingText:text hideAfterDelay:delay dismissCompletion:nil];
}

+ (void)showLoadingText:(NSString *)text
         hideAfterDelay:(NSTimeInterval)delay
      dismissCompletion:(GTToastDismissCompletion)completionBlock
{
    if (![GTToast checkValid]) {
        return;
    }
    UIView *view = [GTToastManager shareInstance].sharedView;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //image
    NSString *bundle_path = [[NSBundle mainBundle] pathForResource:@"GTToast" ofType:@"bundle"];
    NSBundle *gtBundle = [NSBundle bundleWithPath:bundle_path];
    NSString *load_path = [[gtBundle resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", @"gt_load"]];
    if (!load_path) {
        [hud hideAnimated:YES];
        return;
    }
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:load_path]];
    hud.customView = imgView;
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue =  [NSNumber numberWithFloat: M_PI *2];
    animation.duration  = 0.7;
    animation.autoreverses = NO;
    animation.fillMode =kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT;
    [imgView.layer addAnimation:animation forKey:nil];
    //文字
    hud.label.text = text;
    hud.label.font = [GTToastManager shareInstance].textFont;
    hud.label.textColor = [GTToastManager shareInstance].textColor;
    hud.contentColor = [GTToastManager shareInstance].textColor;
    hud.bezelView.backgroundColor = [GTToastManager shareInstance].backgroundColor;
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = YES; //阻止用户的操作
    hud.mode = MBProgressHUDModeCustomView;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:delay];
    hud.completionBlock = ^{
        if (completionBlock) {
            completionBlock();
        }
    };
}

/** progress */
+ (void)showProgress:(CGFloat)progress{
    [GTToast showProgress:progress Text:nil];
}

+ (void)showProgress:(CGFloat)progress Text:(NSString *)text{
    [GTToast showProgress:progress Text:text dismissCompletion:nil];
}

+ (void)showProgress:(CGFloat)progress
                Text:(NSString *)text
   dismissCompletion:(GTToastDismissCompletion)completionBlock
{
    if (![GTToast checkValid]) {
        return;
    }
    UIView *view = [GTToastManager shareInstance].sharedView;
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:NO];
        hud.mode = MBProgressHUDModeAnnularDeterminate;
        hud.label.text = text;
        hud.label.font = [GTToastManager shareInstance].textFont;
        hud.label.textColor = [GTToastManager shareInstance].textColor;
        hud.contentColor = [GTToastManager shareInstance].textColor;
        hud.bezelView.backgroundColor = [GTToastManager shareInstance].backgroundColor;
        hud.removeFromSuperViewOnHide = YES;
        hud.userInteractionEnabled = YES;//阻止用户的操作
        [hud showAnimated:NO];
        hud.completionBlock = ^{
            if (completionBlock) {
                completionBlock();
            }
        };
    }
    [hud setProgress:progress];
    if (progress >= 1.0) {
        [hud hideAnimated:NO];
    }
}

/** 展示超长文本：传时间则按照时间显示，不传内部计算显示时间 */
+ (void)showAllText:(NSString *)text{
    NSTimeInterval delay = [GTToast smartDelaySecondsForTipsText:text];
    [GTToast showAllText:text hideAfterDelay:delay];
}

+ (void)showAllText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay{
    [GTToast showAllText:text hideAfterDelay:delay dismissCompletion:nil];
}

+ (void)showAllText:(NSString *)text dismissCompletion:(GTToastDismissCompletion)completionBlock{
    NSTimeInterval delay = [GTToast smartDelaySecondsForTipsText:text];
    [GTToast showLoadingText:text hideAfterDelay:delay dismissCompletion:completionBlock];
}

+ (void)showAllText:(NSString *)text
     hideAfterDelay:(NSTimeInterval)delay
  dismissCompletion:(GTToastDismissCompletion)completionBlock
{
    if (delay <= 0) {
        delay = kDefaultDuration;
    }
    UIView *view = [GTToastManager shareInstance].sharedView;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = nil;
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = [GTToastManager shareInstance].textFont;
    hud.detailsLabel.textColor = [GTToastManager shareInstance].textColor;
    hud.contentColor = [GTToastManager shareInstance].textColor;
    hud.bezelView.backgroundColor = [GTToastManager shareInstance].backgroundColor;
    hud.userInteractionEnabled = ![GTToastManager shareInstance].userCanTouchView;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:delay];
    hud.completionBlock = ^{
        if (completionBlock) {
            completionBlock();
        }
    };
}

+ (NSTimeInterval)smartDelaySecondsForTipsText:(NSString *)text {
    NSUInteger length = [GTToast gt_lengthWhenCountingNonASCIICharacterAsTwo:text];
    if (length <= 20) {
        return 1.5;
    } else if (length <= 40) {
        return 2.0;
    } else if (length <= 50) {
        return 2.5;
    } else {
        return 3.0;
    }
}

+ (NSUInteger)gt_lengthWhenCountingNonASCIICharacterAsTwo:(NSString *)text {
    NSUInteger length = 0;
    for (NSUInteger i = 0, l = text.length; i < l; i++) {
        unichar character = [text characterAtIndex:i];
        if (isascii(character)) {
            length += 1;
        } else {
            length += 2;
        }
    }
    return length;
}

/** 网络统一请求时loading */
+ (void)loading{
    
    if (![GTToast checkValid]) {
        return;
    }
    UIView *view = [GTToastManager shareInstance].sharedView;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = YES;//阻止用户的操作
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    //custom view, 使用 autolayout
    UIImageView *mImageView = [[UIImageView alloc] init];
    mImageView.backgroundColor = [UIColor clearColor];
    //image
    mImageView.image = [UIImage gt_imageWithGIFNamed:@"gt_loading"];
    hud.customView = mImageView;
    mImageView.translatesAutoresizingMaskIntoConstraints = NO;
    // 只需要 Width 和 Height 约束即可
    [mImageView addConstraint:[NSLayoutConstraint constraintWithItem:mImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50]];
    [mImageView addConstraint:[NSLayoutConstraint constraintWithItem:mImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50]];
    [hud showAnimated:YES];
}

/** hidden */
+ (void)hidden{
    UIView *view = [GTToastManager shareInstance].sharedView;
    if (!view) return;
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    while (hud) {
        [hud hideAnimated:YES];
        hud = [MBProgressHUD HUDForView:view];
    }
}

/** 检验合法 */
+ (BOOL)checkValid{
    
    //1.控制时间
    CGFloat duration = kDefaultDuration;
    if (duration <= 0) {
        return NO;
    }
    //2.控制显示
    UIView *view = [GTToastManager shareInstance].sharedView;
    if (view == nil) {
        return NO;
    }
    return YES;
}

@end
