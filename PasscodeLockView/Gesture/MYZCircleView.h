//
//  MYZCircleView.h
//  PasscodeLockDemo
//
//  Created by MA806P on 16/8/1.
//  Copyright © 2016年 myz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYMacro.h"

typedef enum : NSUInteger {
    GestureViewStatusNormal,
    GestureViewStatusSelected,
    GestureViewStatusSelectedAndShowArrow,
    GestureViewStatusError,
    GestureViewStatusErrorAndShowArrow,
} GestureViewStatus;


#define CircleNormalColor UIColorWithHex(0x33CCFF)
#define CircleSelectedColor UIColorWithHex(0x3393F2)
#define CircleErrorColor UIColorWithHex(0xFF0033)

@interface MYZCircleView : UIView

@property (nonatomic, assign) GestureViewStatus circleStatus;

@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *errorColor;

/** 相邻两圆圈连线的方向角度 */
@property (nonatomic) CGFloat angle;

@end
