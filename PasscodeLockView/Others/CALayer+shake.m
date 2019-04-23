//
//  CALayer+Shake.m
//  PasscodeLockDemo
//
//  Created by MA806P on 16/8/10.
//  Copyright © 2016年 myz. All rights reserved.
//

#import "CALayer+shake.h"

@implementation CALayer (Shake)

- (void)shake
{
    CAKeyframeAnimation * keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat x = 10;
    keyAnimation.values = @[@(-x),@(0),@(x),@(0),@(-x),@(0),@(x),@(0)];
    keyAnimation.duration = 0.25;
    keyAnimation.repeatCount = 2;
    keyAnimation.removedOnCompletion = YES;
    [self addAnimation:keyAnimation forKey:nil];
}


@end
