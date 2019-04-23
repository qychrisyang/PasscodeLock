//
//  MYZPasscodeView.h
//  PasscodeLockDemo
//
//  Created by MA806P on 16/7/28.
//  Copyright © 2016年 myz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYZPasscodeView : UIView

- (void)showFingerprintTouch;

@property (nonatomic, copy) void(^PasscodeValueDidChanged)(NSString * value);
@property (nonatomic, copy) BOOL(^PasscodeResult)(NSString * passcode);

@property (nonatomic, assign) NSInteger numberOfPasscode;
@property (nonatomic, getter=isHideFingerprintBtn) BOOL hideFingerprintBtn;
@property (nonatomic, getter=isHideDeleteBtn) BOOL hideDeleteBtn;

@property (nonatomic, strong) UIColor *passcodeColor;

@property (nonatomic) CGFloat numberFontSize;
@property (nonatomic) UIFontWeight numberFontWeight;

- (void)deleteLastPasscode;
- (void)clearPasscode;

@end
