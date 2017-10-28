//
//  MYZGestureShapeView.h
//  PasscodeLockDemo
//
//  Created by 159CaiMini02 on 16/8/4.
//  Copyright © 2016年 myz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYMacro.h"

#define CircleColor UIColorWithHex(0x33CCFF)

@interface MYZGestureShapeView : UIView

@property (nonatomic, strong) UIColor *circleColor;

@property (nonatomic, copy) NSString * gestureCode;

@end
