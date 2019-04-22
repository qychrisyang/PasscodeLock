//
//  MYZPasscodeInfoView.h
//  PasscodeLockDemo
//
//  Created by 159CaiMini02 on 16/8/23.
//  Copyright © 2016年 myz. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSInteger const DefaultPasscodeCount;

@interface MYZPasscodeInfoView : UIView

@property (nonatomic) NSInteger numberOfPasscode;
@property (nonatomic) NSInteger infoCount;

@property (nonatomic, strong) UIColor *infoColor;

@end
