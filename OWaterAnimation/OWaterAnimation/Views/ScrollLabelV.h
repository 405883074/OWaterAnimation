//
//  ScrollLabelV.h
//  OWaterAnimation
//
//  Created by WangZhipeng on 15/12/10.
//  Copyright © 2015年 WangZhipeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Scrolltype) {
    SingleDigitType,
    TensDigitType
};

@interface ScrollLabelV : UIView

- (instancetype)initWithFrame:(CGRect)frame withType:(Scrolltype)type;

- (void)scollToNum:(int)num;

@end
