//
//  GTToastManager.m
//  GTToast
//
//  Created by cocomanber on 2019/5/12.
//  Copyright © 2019 cocomanber. All rights reserved.
//

#import "GTToastManager.h"

@implementation GTToastManager

static GTToastManager *_instance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
            
            _instance.toastStyle = GTToastStyleDefault;
            _instance.toastPosition = GTToastPositionCenter;
            _instance.defaultDuration = 1.5f;
            _instance.userCanTouchView = YES;
            _instance.centreOffset = 0;
            _instance.bomttomOffset = [UIScreen mainScreen].bounds.size.height * 0.3;
            _instance.topOffset = -[UIScreen mainScreen].bounds.size.height * 0.3;
        }
    });
    return _instance;
}

-(id)copyWithZone:(NSZone *)zone{
    return _instance;
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}

+ (instancetype)shareInstance{
    return [[self alloc]init];
}

/** 重置回到初始状态 */
- (void)reSet{
    
}

#pragma mark -

/** 拿当前的window */

- (UIView *)sharedView {
    UIWindow *window;
    window = [UIApplication sharedApplication].delegate.window;
    if (!window) {
        window = [UIApplication sharedApplication].keyWindow;
    }
    if (!window) {
        window = [UIApplication sharedApplication].windows.lastObject;
    }
    return window;
}

/** 配置UI */

- (void)setToastStyle:(GTToastStyle)toastStyle{
    if (toastStyle != _toastStyle) {
        _toastStyle = toastStyle;
        switch (toastStyle) {
            case GTToastStyleDefault:
            {
                _backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
                _textColor =[UIColor whiteColor];
                _textFont = [UIFont systemFontOfSize:16.f];
                _detailTextColor = [UIColor whiteColor];
                _detailTextFont = [UIFont systemFontOfSize:12.f];
            }
                break;
            case GTToastStyleTheme:
            {
                _backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
                _textColor =[UIColor whiteColor];
                _textFont = [UIFont systemFontOfSize:16.f];
                _detailTextColor = [UIColor whiteColor];
                _detailTextFont = [UIFont systemFontOfSize:12.f];
            }
                break;
            default:
                break;
        }
    }
}


@end
