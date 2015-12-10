//
//  ButtonAnimationV.h
//  OWaterAnimation
//
//  Created by WangZhipeng on 15/12/10.
//  Copyright © 2015年 WangZhipeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonAnimationVDelegate <NSObject>

- (void)buttonDidClick;

@end

@interface ButtonAnimationV : UIView

@property (nonatomic, weak) id<ButtonAnimationVDelegate> delegate;

@end
