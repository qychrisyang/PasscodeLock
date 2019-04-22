//
//  MYZPasscodeInfoView.m
//  PasscodeLockDemo
//
//  Created by 159CaiMini02 on 16/8/23.
//  Copyright © 2016年 myz. All rights reserved.
//

#import "MYZPasscodeInfoView.h"

@implementation MYZPasscodeInfoView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        self.infoColor = [UIColor grayColor];
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSInteger numberOfPasscode = DefaultPasscodeCount;
    if (self.numberOfPasscode > 0) {
        numberOfPasscode = self.numberOfPasscode;
    }
    
    // Drawing code
    
    CGContextRef cr = UIGraphicsGetCurrentContext();
    [self.infoColor set];
    
    CGFloat h = rect.size.height;
    CGFloat w = rect.size.width;
    
    
    CGFloat marginLR = 15.0;
    CGFloat circleWH = (8.0/568.0)*[UIScreen mainScreen].bounds.size.height;
    CGFloat marginLeft = (w - circleWH * numberOfPasscode * 1.0 - marginLR * (numberOfPasscode - 1) * 1.0) * 0.5;
    CGFloat circleY = h > circleWH ? (h - circleWH) * 0.5 : 0.0;
    
    
    
    
    for (int i = 0; i < numberOfPasscode; i++)
    {
        CGFloat circleX = marginLeft + (circleWH + marginLR) * i;
        
        CGContextAddEllipseInRect(cr, CGRectMake(circleX, circleY, circleWH, circleWH));
        if (i+1 <= self.infoCount)
        {
            CGContextFillPath(cr);
        }
        else
        {
            CGContextStrokePath(cr);
        }
    }
    
    
}


- (void)setNumberOfPasscode:(NSInteger)numberOfPasscode
{
    _numberOfPasscode = numberOfPasscode;
    
    [self setNeedsDisplay];
}

- (void)setInfoCount:(NSInteger)infoCount
{
    _infoCount = infoCount;
    
    [self setNeedsDisplay];
}

- (void)setInfoColor:(UIColor *)infoColor {
    _infoColor = infoColor;
    
    [self setNeedsDisplay];
}


@end
