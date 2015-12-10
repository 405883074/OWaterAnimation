//
//  ViewController.m
//  OWaterAnimation
//
//  Created by WangZhipeng on 15/12/10.
//  Copyright © 2015年 WangZhipeng. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+HexColor.h"
#import "ButtonAnimationV.h"

@interface ViewController () <ButtonAnimationVDelegate> {
    ButtonAnimationV *buttonAnimationV;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView {
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#1E384C"
                                                      alpha:1];
    
    buttonAnimationV = [[ButtonAnimationV alloc] initWithFrame:CGRectMake(100, 200, 200, 60)];
    buttonAnimationV.center = CGPointMake(self.view.center.x, self.view.center.y + 200);
    buttonAnimationV.delegate = self;
    [self.view addSubview:buttonAnimationV];
    
}

- (void)buttonDidClick {
    NSLog(@"%s", __FUNCTION__);
}

@end
