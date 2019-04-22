//
//  MYZNumberView.h
//  PasscodeLockDemo
//
//  Created by 159CaiMini02 on 16/8/18.
//  Copyright © 2016年 myz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
    NumberViewStateNormal,
    NumberViewStateHighlight,
    
} NumberViewState;


@interface MYZNumberView : UIView

@property (nonatomic, copy) NSString * numberText;

@property (nonatomic) NumberViewState numberViewState;

@property (nonatomic, strong) UIColor *numberColor;

@property (nonatomic) CGFloat numberFontSize;
@property (nonatomic) UIFontWeight numberFontWeight;

@end
