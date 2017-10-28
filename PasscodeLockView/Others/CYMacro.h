//
//  CYMacro.h
//  PasscodeLockDemo
//
//  Created by Chris on 29/09/2017.
//  Copyright © 2017 CY. All rights reserved.
//

#ifndef CYMacro_h
#define CYMacro_h

#define UIColorWithR_G_B_A(r, g, b, a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define UIColorWithR_G_B(r, g, b)       UIColorWithR_G_B_A(r, g, b, 1.0f)

#define UIColorWithHex_A(hexRGB, alpha) UIColorWithR_G_B_A((hexRGB & 0xFF0000) >> 16, (hexRGB & 0xFF00) >> 8, hexRGB & 0xFF, alpha)
#define UIColorWithHex(hexRGB)          UIColorWithHex_A(hexRGB, 1.0f)

#endif /* CYMacro_h */
