//
//  ScrollLabelV.m
//  OWaterAnimation
//
//  Created by WangZhipeng on 15/12/10.
//  Copyright © 2015年 WangZhipeng. All rights reserved.
//

#import "ScrollLabelV.h"
#import "UIColor+HexColor.h"

@interface ScrollLabelV () {
    UIScrollView *scrollView;
    Scrolltype _type;
}
@end

@implementation ScrollLabelV

- (instancetype)initWithFrame:(CGRect)frame withType:(Scrolltype)type {
    if (self = [super initWithFrame:frame]) {
        _type = type;
        scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) * 10);
        scrollView.userInteractionEnabled = NO;
        [self addSubview:scrollView];
        
        for (int i = 0; i < 10; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds) * i, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
            label.text = [NSString stringWithFormat:@"%d", i];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:100];
            label.textColor = [UIColor colorWithHexString:@"C4F8FB" alpha:1];
            [scrollView addSubview:label];
        }
    }
    return self;
}

- (void)scollToNum:(int)num
{
//    UIView.animateWithDuration(1, animations: { () -> Void in
//        self.singleDigitsScroll.contentOffset = CGPointMake(0, CGRectGetHeight(self.bounds) * CGFloat(num))
//    })
    [UIView animateWithDuration:0.85 animations:^{
        scrollView.contentOffset = CGPointMake(0, CGRectGetHeight(self.bounds) * num);
    }];
    
}

@end
