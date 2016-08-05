//
//  MYZCircleView.h
//  PasscodeLockDemo
//
//  Created by MA806P on 16/8/1.
//  Copyright © 2016年 myz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    GestureViewStatusNormal,
    GestureViewStatusSelected,
    GestureViewStatusError,
} GestureViewStatus;


#define CircleNormalColor [UIColor colorWithWhite:0.498 alpha:1.000];
#define CircleSelectedColor [UIColor blueColor];
#define CircleErrorColor [UIColor redColor];


@interface MYZCircleView : UIView

@property (nonatomic, assign) GestureViewStatus circleStatus;


@end