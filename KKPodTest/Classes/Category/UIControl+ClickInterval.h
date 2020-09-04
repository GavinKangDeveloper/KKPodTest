//
//  UIControl+ClickInterval.h
//  DemoYiXinLi
//
//  Created by kangkang zhu on 2020/4/28.
//  Copyright © 2020 KangkangZhu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (ClickInterval)
/// 点击事件响应的时间间隔
@property (nonatomic, assign) NSTimeInterval clickInterval;
/// 交换点击方法
+ (void)exchangeClickMethod;
@end

NS_ASSUME_NONNULL_END
