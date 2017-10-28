//
//  MYZCircleView.m
//  PasscodeLockDemo
//
//  Created by MA806P on 16/8/1.
//  Copyright © 2016年 myz. All rights reserved.
//

#import "MYZCircleView.h"


//外空心圆边界宽度
CGFloat const circleBorderWidth = 1.0f;
//内部的实心圆所占外圆的比例大小
CGFloat const circleRatio = 0.3f;
//三角形箭头的边长
CGFloat const arrowH = 8.0;



@interface MYZCircleView ()

@property (nonatomic, strong) UIColor * circleColor;

@end

@implementation MYZCircleView

@synthesize normalColor = _normalColor, selectedColor = _selectedColor, errorColor = _errorColor;

- (UIColor *)normalColor {
    if (_normalColor == nil) {
        _normalColor = CircleNormalColor;
    }
    
    return _normalColor;
}

- (void)setNormalColor:(UIColor *)normalColor {
    _normalColor = normalColor;
    [self refreshCircleColor];
}

- (UIColor *)selectedColor {
    if (_selectedColor == nil) {
        _selectedColor = CircleSelectedColor;
    }
    
    return _selectedColor;
}

- (void)setSelectedColor:(UIColor *)selectedColor {
    _selectedColor = selectedColor;
    [self refreshCircleColor];
}

- (UIColor *)errorColor {
    if (_errorColor == nil) {
        _errorColor = CircleErrorColor;
    }
    
    return _errorColor;
}

- (void)setErrorColor:(UIColor *)errorColor {
    _errorColor = errorColor;
    [self refreshCircleColor];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        self.circleStatus = GestureViewStatusNormal;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGContextRef cr = UIGraphicsGetCurrentContext();
    CGContextClearRect(cr, rect);
    
    //画外圆圈
    CGFloat circleDiameter = MIN(rect.size.width, rect.size.height) - circleBorderWidth * 2.0;
    CGRect circleInRect = CGRectMake(circleBorderWidth, circleBorderWidth, circleDiameter, circleDiameter);
    CGContextAddEllipseInRect(cr, circleInRect);
    CGContextSetLineWidth(cr, circleBorderWidth);
    [self.circleColor set];
    CGContextStrokePath(cr);
    
    //画内实心圆
    if (self.circleStatus != GestureViewStatusNormal)
    {
        CGFloat filledCircleDiameter = circleDiameter * circleRatio;
        CGFloat filledCircleX = (rect.size.width - filledCircleDiameter)*0.5;
        CGFloat filledCircleY = (rect.size.height - filledCircleDiameter)*0.5;
        CGContextAddEllipseInRect(cr, CGRectMake(filledCircleX, filledCircleY, filledCircleDiameter, filledCircleDiameter));
        [self.circleColor set];
        CGContextFillPath(cr);
        
        
        //画指示方向三角箭头
        if (self.circleStatus == GestureViewStatusSelectedAndShowArrow || self.circleStatus == GestureViewStatusErrorAndShowArrow)
        {
            //先平移到圆心然后在旋转然后在平移回来
            CGFloat offset = MIN(rect.size.width, rect.size.height) * 0.5;
            CGContextTranslateCTM(cr, offset, offset);
            CGContextRotateCTM(cr, self.angle);
            CGContextTranslateCTM(cr, -offset, -offset);
            
            CGFloat arrowMargin = (filledCircleY - arrowH) * 0.5;
            CGContextMoveToPoint(cr, (rect.size.width - arrowH * 1.5) * 0.5 , filledCircleY - arrowMargin);
            CGContextAddLineToPoint(cr, (rect.size.width + arrowH * 1.5) * 0.5 , filledCircleY - arrowMargin);
            CGContextAddLineToPoint(cr, rect.size.width * 0.5 , filledCircleY - arrowMargin - arrowH);
            CGContextClosePath(cr);
            CGContextSetFillColorWithColor(cr, self.circleColor.CGColor);
            CGContextFillPath(cr);
        }
        
    }
    
    
    
}

- (void)refreshCircleColor {
    if (_circleStatus == GestureViewStatusNormal)
    {
        self.circleColor = self.normalColor;
    }
    else if (_circleStatus == GestureViewStatusSelected || _circleStatus == GestureViewStatusSelectedAndShowArrow)
    {
        self.circleColor = self.selectedColor;
    }
    else if (_circleStatus == GestureViewStatusError || _circleStatus == GestureViewStatusErrorAndShowArrow)
    {
        self.circleColor = self.errorColor;
    }
    
    [self setNeedsDisplay];
}

- (void)setCircleStatus:(GestureViewStatus)circleStatus
{
    _circleStatus = circleStatus;
    
    [self refreshCircleColor];
}

@end
