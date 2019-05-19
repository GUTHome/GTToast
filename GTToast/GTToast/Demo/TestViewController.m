//
//  TestViewController.m
//  GTToast
//
//  Created by cocomanber on 2019/5/12.
//  Copyright © 2019 cocomanber. All rights reserved.
//

#import "TestViewController.h"
#import "GTToast.h"

#define text @"这是一条很有价值的信息"
#define longtext @"这是一条很有价值的信息，这是一条很有价值的信息这是一条很有价值的信息，这是一条很有价值的信息这是一条很有价值的信息，这是一条很有价值的信息这是一条很有价值的信息这是一条很有价值的信息"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    for (int i = 0; i < 13; i ++) {
        UIButton *button = [UIButton new];
        button.tag = i;
        button.backgroundColor = [UIColor lightGrayColor];
        button.frame = CGRectMake(20, 150 + (i * 30 + (10)*(i-1)), 300, 30);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)buttonClick:(UIButton *)button{
    switch (button.tag) {
        case 0:
        {
            [GTToast showText:text dismissCompletion:^{
                [button setTitle:@"展示文本+回调" forState:UIControlStateNormal];
            }];
            
        }
            break;
        case 1:
        {
            [GTToast showText:text detailText:longtext];
            [button setTitle:@"展示两段文本" forState:UIControlStateNormal];
        }
            break;
        case 2:
        {
            [GTToast showText:text hideAfterDelay:5];
            [button setTitle:@"展示文本，控制时间" forState:UIControlStateNormal];
        }
            break;
        case 3:
        {
            //[GTToast showInfoText:text];
            [GTToast showInfoText:text detailText:longtext dismissCompletion:^{
                [button setTitle:@"显示info+文字+回调" forState:UIControlStateNormal];
            }];
            
        }
            break;
        case 4:
        {
            //[GTToast showErrorText:text];
            [GTToast showErrorText:text detailText:longtext dismissCompletion:^{
                [button setTitle:@"显示error+文字" forState:UIControlStateNormal];
            }];
            
        }
            break;
        case 5:
        {
            //[GTToast showSuccessText:text];
            [GTToast showSuccessText:text detailText:longtext dismissCompletion:^{
                [button setTitle:@"显示success+文字" forState:UIControlStateNormal];
            }];
            
        }
            break;
        case 6:
        {
            [GTToast showLoadingHideAfterDelay:2];
            [button setTitle:@"show loading + 时间控制" forState:UIControlStateNormal];
        }
            break;
        case 7:
        {
            [GTToast showLoadingText:text hideAfterDelay:2];
            [button setTitle:@"show loading + 文字 + 时间控制" forState:UIControlStateNormal];
        }
            break;
        case 8:
        {
            [GTToast showAllText:longtext];
            [button setTitle:@"show longText + 内部计算时间" forState:UIControlStateNormal];
        }
            break;
        case 9:
        {
            [GTToast showAllText:longtext hideAfterDelay:5];
            [button setTitle:@"show longText + 外部控制时间" forState:UIControlStateNormal];
        }
            break;
        case 10:
        {
            [GTToast loading];
            [button setTitle:@"loading" forState:UIControlStateNormal];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [GTToast hidden];
            });
        }
            break;
        case 11:
        {
            [button setTitle:@"progress" forState:UIControlStateNormal];
            float progress = 0.0f;
            while (progress < 1.0f) {

                progress += 0.01;
                [GTToast showProgress:progress Text:text];
                usleep(50000);
            }
            
            // 圆形进度条
//            MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
//            [self.view addSubview:HUD];
//            HUD.mode = MBProgressHUDModeDeterminate;
//            HUD.labelText = @"等待中";
//            [HUD showWhileExecuting:@selector(ProgressBar) onTarget:self withObject:nil animated:YES];
        }
            break;
        case 12:
        {
            [GTToast hidden];
            [button setTitle:@"hidden" forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }
}

//
- (void)ProgressBar{
    float progress = 0.0f;
        while (progress < 1.0f) {
        progress += 0.01f;
            dispatch_async(dispatch_get_main_queue(), ^{
               [MBProgressHUD HUDForView:self.view].progress = progress;
            });
        usleep(50000);
    }
}

@end
