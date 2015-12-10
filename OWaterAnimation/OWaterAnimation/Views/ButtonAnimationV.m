//
//  ButtonAnimationV.m
//  OWaterAnimation
//
//  Created by WangZhipeng on 15/12/10.
//  Copyright © 2015年 WangZhipeng. All rights reserved.
//

#import "ButtonAnimationV.h"

@interface ButtonAnimationV () {
    UIView *viewBorder;
    UIButton *buttonInside;
}

@end

@implementation ButtonAnimationV

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                              0,
                                                              CGRectGetWidth(frame),
                                                              CGRectGetHeight(frame))];
        viewBorder.layer.borderWidth = 2;
        viewBorder.layer.borderColor = [UIColor whiteColor].CGColor;
        viewBorder.layer.cornerRadius = 30;
        viewBorder.layer.masksToBounds = YES;
        
        CGRect buttonRect = CGRectInset(viewBorder.bounds, 2, 2);
        buttonInside = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonInside.frame = buttonRect;
        buttonInside.layer.masksToBounds = YES;
        buttonInside.layer.cornerRadius = 30;
        [buttonInside setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buttonInside setTitle:@"91360病理"
                      forState:UIControlStateNormal];
        [buttonInside addTarget:self
                         action:@selector(startAnimation)
               forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:viewBorder];
        [self addSubview:buttonInside];
    }
    
    return self;
}

- (void)startAnimation {
    
    buttonInside.backgroundColor = [UIColor blackColor];
    [UIView animateWithDuration:0.5 animations:^{
        viewBorder.transform = CGAffineTransformMakeScale(1.3, 1.3);
        viewBorder.alpha = 0;
        
        buttonInside.alpha = 0;
        
    } completion:^(BOOL finished) {
        viewBorder.transform = CGAffineTransformIdentity;
        viewBorder.alpha = 1;
        
        buttonInside.alpha = 1;
        buttonInside.backgroundColor = [UIColor clearColor];
        
    }];
    
    if ([self.delegate respondsToSelector:@selector(buttonDidClick)]) {
        [self.delegate buttonDidClick];
    }
}

@end
