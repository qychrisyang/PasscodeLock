//
//  MYZGestureView.m
//  PasscodeLockDemo
//
//  Created by MA806P on 16/7/28.
//  Copyright © 2016年 myz. All rights reserved.
//

#import "MYZGestureView.h"
#import "MYZCircleView.h"


//圆圈九宫格边界大小
CGFloat const CircleViewMarginBorder = 5.0f;
CGFloat const CircleViewMarginNear = 30.0f;
//圆圈视图tag初始值
NSInteger const CircleViewBaseTag = 100;

//连线的宽度
CGFloat const LineWidth = 4.0f;




@interface MYZGestureView ()

@property (nonatomic, strong) NSMutableArray * selectCircleArray;

@property (nonatomic, assign) CGPoint currentTouchPoint;

@property (nonatomic, assign) GestureViewStatus gestureViewStatus;
@property (nonatomic, strong) UIColor * lineColor;

@end


@implementation MYZGestureView

@synthesize lineNormalColor = _lineNormalColor, lineSelectedColor = _lineSelectedColor, lineErrorColor = _lineErrorColor;

- (UIColor *)lineNormalColor {
    if (_lineNormalColor == nil) {
        _lineNormalColor = LineNormalColor;
    }
    
    return _lineNormalColor;
}

- (void)setLineNormalColor:(UIColor *)lineNormalColor {
    _lineNormalColor = lineNormalColor;
    [self refreshLineColor];
}

- (UIColor *)lineSelectedColor {
    if (_lineSelectedColor == nil) {
        _lineSelectedColor = LineSelectedColor;
    }
    
    return _lineSelectedColor;
}

- (void)setLineSelectedColor:(UIColor *)lineSelectedColor {
    _lineSelectedColor = lineSelectedColor;
    [self refreshLineColor];
}

- (UIColor *)lineErrorColor {
    if (_lineErrorColor == nil) {
        _lineErrorColor = LineErrorColor;
    }
    
    return _lineErrorColor;
}

- (void)setLineErrorColor:(UIColor *)lineErrorColor {
    _lineErrorColor = lineErrorColor;
    [self refreshLineColor];
}

- (UIColor *)circleNormalColor {
    MYZCircleView *circleView = [self viewWithTag:CircleViewBaseTag];
    return circleView.normalColor;
}

- (void)setCircleNormalColor:(UIColor *)circleNormalColor {
    for (int i = 0; i < 9; i++) {
        MYZCircleView *circleView = [self viewWithTag:i + CircleViewBaseTag];
        circleView.normalColor = circleNormalColor;
    }
}

- (UIColor *)circleSelectedColor {
    MYZCircleView *circleView = [self viewWithTag:CircleViewBaseTag];
    return circleView.selectedColor;
}

- (void)setCircleSelectedColor:(UIColor *)circleSelectedColor {
    for (int i = 0; i < 9; i++) {
        MYZCircleView *circleView = [self viewWithTag:i + CircleViewBaseTag];
        circleView.selectedColor = circleSelectedColor;
    }
}

- (UIColor *)circleErrorColor {
    MYZCircleView *circleView = [self viewWithTag:CircleViewBaseTag];
    return circleView.errorColor;
}

- (void)setCircleErrorColor:(UIColor *)circleErrorColor {
    for (int i = 0; i < 9; i++) {
        MYZCircleView *circleView = [self viewWithTag:i + CircleViewBaseTag];
        circleView.errorColor = circleErrorColor;
    }
}

#pragma mark - initializer

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initSubviews];
    }
    return self;
}

//子视图初始化
- (void)initSubviews
{
    self.backgroundColor = [UIColor clearColor];
    
    for (int i=0; i<9; i++)
    {
        MYZCircleView * circle = [[MYZCircleView alloc] init];
        circle.tag = i+CircleViewBaseTag;
        [self addSubview:circle];
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //手势解锁视图的大小
    CGFloat squareWH = MIN(self.frame.size.width, self.frame.size.height);
    CGFloat offsetY = 0.0;
    CGFloat offsetX = 0.0;
    if (self.frame.size.width >= self.frame.size.height)
    {
        offsetX = (self.frame.size.width - self.frame.size.height) * 0.5;
    }
    else
    {
        offsetY = (self.frame.size.height - self.frame.size.width) * 0.5;
    }
    
    
    //小圆的大小
    CGFloat circleWH = (squareWH - (CircleViewMarginBorder+CircleViewMarginNear)*2.0)/3.0;
    
    
    for (int i = 0; i < 9; i++)
    {
        MYZCircleView * circleView = [self viewWithTag:i+CircleViewBaseTag];
        
        NSInteger currentRow = i / 3;
        NSInteger currentColumn = i % 3;
        CGFloat circleX = CircleViewMarginBorder + (CircleViewMarginNear + circleWH) * currentColumn;
        CGFloat circleY = CircleViewMarginBorder + (CircleViewMarginNear + circleWH) * currentRow;
        
        circleView.frame = CGRectMake(circleX + offsetX, circleY + offsetY, circleWH, circleWH);
    }
    
}

#pragma mark - setter getter


- (NSMutableArray *)selectCircleArray
{
    if (_selectCircleArray == nil)
    {
        _selectCircleArray = [NSMutableArray array];
    }
    return _selectCircleArray;
}

- (void)setGestureViewStatus:(GestureViewStatus)gestureViewStatus
{
    _gestureViewStatus = gestureViewStatus;
    
    [self refreshLineColor];
}

- (void)refreshLineColor {
    if (_gestureViewStatus == GestureViewStatusNormal)
    {
        self.lineColor = self.lineNormalColor;
    }
    else if (_gestureViewStatus == GestureViewStatusSelected)
    {
        self.lineColor = self.lineSelectedColor;
    }
    else if (_gestureViewStatus == GestureViewStatusError)
    {
        self.lineColor = self.lineErrorColor;
    }
    
    [self setNeedsDisplay];
}

#pragma mark - draw view

- (void)drawRect:(CGRect)rect
{
    if (self.isHideGesturePath) {  return;  }
    
    self.clearsContextBeforeDrawing = YES;
    CGContextRef cr = UIGraphicsGetCurrentContext();
    
    //剪切，画线只能在圆外画
    CGContextAddRect(cr, rect);
    for (int i = 0; i < 9; i++)
    {
        MYZCircleView * circleView = [self viewWithTag:i+CircleViewBaseTag];
        CGContextAddEllipseInRect(cr, circleView.frame);
    }
    CGContextEOClip(cr);
    
    
    //画线
    for (int i = 0; i<self.selectCircleArray.count; i++)
    {
        MYZCircleView * circleView = self.selectCircleArray[i];
        CGPoint circleCentre = circleView.center;
        if (i == 0)
        {
            CGContextMoveToPoint(cr, circleCentre.x, circleCentre.y);
        }
        else
        {
            CGContextAddLineToPoint(cr, circleCentre.x, circleCentre.y);
        }
    }
    
    
    [self.selectCircleArray enumerateObjectsUsingBlock:^(MYZCircleView * circleView, NSUInteger idx, BOOL * _Nonnull stop) {
        if (circleView.circleStatus != GestureViewStatusError && circleView.circleStatus != GestureViewStatusErrorAndShowArrow)
        {
            CGContextAddLineToPoint(cr, self.currentTouchPoint.x, self.currentTouchPoint.y);
        }
    }];
    
    CGContextSetLineCap(cr, kCGLineCapRound);
    CGContextSetLineWidth(cr, LineWidth);
    [self.lineColor set];
    CGContextStrokePath(cr);
    
}


#pragma mark - Touch event

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self cleanViews];
    [self checkCircleViewTouch:touches];
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self checkCircleViewTouch:touches];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    NSMutableString * gestureCode = [NSMutableString string];
    for (MYZCircleView * circleView in self.selectCircleArray)
    {
        [gestureCode appendFormat:@"%ld",(long)(circleView.tag - CircleViewBaseTag)];
        //circleView.circleStatus = GestureViewStatusNormal;
    }
    
    
    if (gestureCode.length > 0 && self.gestureResult != nil)
    {
        BOOL successGesture = self.gestureResult(gestureCode);
        if (successGesture)
        {
            [self cleanViews];
        }
        else
        {
            if (!self.isHideGesturePath)
            {
                for (int i = 0; i < self.selectCircleArray.count; i++)
                {
                    MYZCircleView * circleView = self.selectCircleArray[i];
                    BOOL showArrow = (self.isShowArrowDirection && i != self.selectCircleArray.count - 1);
                    //判断是否显示指示方向的箭头, 最后一个不用显示
                    circleView.circleStatus = showArrow ? GestureViewStatusErrorAndShowArrow : GestureViewStatusError;
                    self.gestureViewStatus = GestureViewStatusError;
                    [self setNeedsDisplay];
                }
                
            }
            
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self cleanViews];
            });
        }
    }
    
    
}



- (void)cleanViews
{
    for (MYZCircleView * circleView in self.selectCircleArray)
    {
        circleView.circleStatus = GestureViewStatusNormal;
    }
    [self.selectCircleArray removeAllObjects];
    [self setNeedsDisplay];
}




- (void)checkCircleViewTouch:(NSSet *)touches
{
    UITouch *touch =  [touches anyObject];
    CGPoint point = [touch locationInView:self];
    self.currentTouchPoint = point;
    
    for (int i = 0; i < 9; i++)
    {
        MYZCircleView * circleView = [self viewWithTag:i+CircleViewBaseTag];
        
        if(CGRectContainsPoint(circleView.frame, point) && ![self.selectCircleArray containsObject:circleView])
        {
            if (!self.isHideGesturePath)
            {
                circleView.circleStatus = GestureViewStatusSelected;
                self.gestureViewStatus = GestureViewStatusSelected;
                
                //计算最后两个选中圆圈的角度，为了画出指示箭头
                if (self.selectCircleArray.count > 0 && self.isShowArrowDirection)
                {
                    MYZCircleView * lastSelectCircleView = [self.selectCircleArray lastObject];
                    
                    CGFloat x1 = circleView.center.x;
                    CGFloat y1 = circleView.center.y;
                    CGFloat x2 = lastSelectCircleView.center.x;
                    CGFloat y2 = lastSelectCircleView.center.y;
                    
                    CGFloat angle = atan2(y1 - y2, x1 - x2) + M_PI_2;
                    lastSelectCircleView.angle = angle;
                    lastSelectCircleView.circleStatus = GestureViewStatusSelectedAndShowArrow;
                }
                
            }
            
            [self.selectCircleArray addObject:circleView];
            break;
        }
    }
}



@end
