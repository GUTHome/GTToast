//
//  GTToastManager.h
//  GTToast
//
//  Created by cocomanber on 2019/5/12.
//  Copyright © 2019 cocomanber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define GTTOAST_IMAGE(name) [UIImage imageNamed:(name)]

typedef NS_ENUM(NSInteger, GTToastStyle){
    GTToastStyleDefault    = 0,    //黑底色0.7透明度 白色字体
    GTToastStyleTheme      = 1,    //红色底0.7透明度 白色字体【test ui】
};

typedef NS_ENUM(NSInteger, GTToastPosition){
    GTToastPositionTop     = 0,    //顶部
    GTToastPositionCenter  = 1,    //默认居中
    GTToastPositionBottom  = 2,    //底部
};

@interface GTToastManager : NSObject

/** 初始化 */
+ (instancetype) shareInstance;
- (void)reSet;

/** 修改到以下配置会影响到全局，如有修改，请使用完后重置 */
@property (nonatomic, assign) GTToastStyle toastStyle;             //toast样式
@property (nonatomic, assign) GTToastPosition toastPosition;       //显示位置，默认是居中
@property (nonatomic, assign) CGFloat defaultDuration;              //显示时间控制，默认1.5
@property (nonatomic, assign) BOOL userCanTouchView;                //是否接受用户触摸，默认是YES接受
@property (nonatomic, assign) CGFloat centreOffset;                 //居中显示偏移量
@property (nonatomic, assign) CGFloat bomttomOffset;                //底部显示偏移量
@property (nonatomic, assign) CGFloat topOffset;                    //顶部显示偏移量

/** 由GTToastStyle控制 */
@property (nonatomic ,strong, readonly) UIColor *backgroundColor;
@property (nonatomic ,strong, readonly) UIColor *textColor;
@property (nonatomic ,strong, readonly) UIFont *textFont;
@property (nonatomic ,strong, readonly) UIColor *detailTextColor;
@property (nonatomic ,strong, readonly) UIFont *detailTextFont;

/** 拿当前视图的window */
- (UIView *)sharedView;

@end


