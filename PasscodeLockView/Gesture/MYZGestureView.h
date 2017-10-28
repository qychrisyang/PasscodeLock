//
//  MYZGestureView.h
//  PasscodeLockDemo
//
//  Created by MA806P on 16/7/28.
//  Copyright © 2016年 myz. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LineNormalColor CircleNormalColor
#define LineSelectedColor CircleSelectedColor
#define LineErrorColor CircleErrorColor

@interface MYZGestureView : UIView

@property (nonatomic, strong) UIColor *lineNormalColor;
@property (nonatomic, strong) UIColor *lineSelectedColor;
@property (nonatomic, strong) UIColor *lineErrorColor;

@property (nonatomic, strong) UIColor *circleNormalColor;
@property (nonatomic, strong) UIColor *circleSelectedColor;
@property (nonatomic, strong) UIColor *circleErrorColor;

/**
 *  手势操作完成回调方法,参数为手势划过的顺序密码0-8
 */
@property (nonatomic, copy) BOOL(^gestureResult)(NSString * gestureCode);

/**
 *  是否显示手势划过的轨迹
 */
@property (nonatomic, getter=isHideGesturePath) BOOL hideGesturePath;

/**
 *  是否显示手势划过的方向,就是每个圆里的三角箭头
 */
@property (nonatomic, getter=isShowArrowDirection) BOOL showArrowDirection;

@end
