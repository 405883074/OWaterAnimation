//
//  ZPWaveV.h
//  OWaterAnimation
//
//  Created by WangZhipeng on 15/12/11.
//  Copyright © 2015年 WangZhipeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPWaveV : UIView

@property (nonatomic, strong)   UIColor *firstWaveColor;    // 第一个波浪颜色
@property (nonatomic, strong)   UIColor *secondWaveColor;   // 第二个波浪颜色

@property (nonatomic, assign)   CGFloat percent;            // 百分比

- (void)startWave;

- (void)stopWave;

- (void)reset;

@end
