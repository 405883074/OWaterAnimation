//
//  ButtonAnimationV.m
//  OWaterAnimation
//
//  Created by WangZhipeng on 15/12/10.
//  Copyright © 2015年 WangZhipeng. All rights reserved.
//

#import "ButtonAnimationV.h"

@interface ButtonAnimationV () {
    UIView *borderV;
    UIButton *insidebtn;
}

@end

@implementation ButtonAnimationV

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        borderV = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                           0,
                                                           CGRectGetWidth(frame),
                                                           CGRectGetHeight(frame))];
        borderV.layer.borderWidth = 2;
        borderV.layer.borderColor = [UIColor whiteColor].CGColor;
        borderV.layer.cornerRadius = 30;
        borderV.layer.masksToBounds = YES;
        
        CGRect buttonRect = CGRectInset(borderV.bounds, 2, 2);
        insidebtn = [UIButton buttonWithType:UIButtonTypeCustom];
        insidebtn.frame = buttonRect;
        insidebtn.layer.masksToBounds = YES;
        insidebtn.layer.cornerRadius = 30;
        [insidebtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [insidebtn setTitle:@"91360病理 + "
                   forState:UIControlStateNormal];
        [insidebtn addTarget:self
                      action:@selector(startAnimation)
            forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:borderV];
        [self addSubview:insidebtn];
    }
    
    return self;
}

- (void)startAnimation {
    
    insidebtn.backgroundColor = [UIColor blackColor];
    [UIView animateWithDuration:0.5 animations:^{
        borderV.transform = CGAffineTransformMakeScale(1.3, 1.3);
        borderV.alpha = 0;
        
        insidebtn.alpha = 0;
        
    } completion:^(BOOL finished) {
        borderV.transform = CGAffineTransformIdentity;
        borderV.alpha = 1;
        
        insidebtn.alpha = 1;
        insidebtn.backgroundColor = [UIColor clearColor];
        
    }];
    
    if ([self.delegate respondsToSelector:@selector(buttonDidClick)]) {
        [self.delegate buttonDidClick];
    }
}

@end
