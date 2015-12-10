//
//  ViewController.m
//  OWaterAnimation
//
//  Created by WangZhipeng on 15/12/10.
//  Copyright © 2015年 WangZhipeng. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+HexColor.h"
#import "WaveV.h"
#import "ButtonAnimationV.h"
#import "ScrollLabelV.h"

@interface ViewController () <ButtonAnimationVDelegate> {
    
    WaveV *waveV;
    
    ButtonAnimationV *buttonAnimationV;
    
    ScrollLabelV *leftScrollLabelV;
    ScrollLabelV *rightScrollLabelV;
    
    int tens;
    int ones;
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configureData];
}

- (void)configureView {
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#1E384C"
                                                      alpha:1];
    
    {
        waveV = [[WaveV alloc] initWithFrame:CGRectMake(0,
                                                        0,
                                                        CGRectGetWidth(self.view.bounds),
                                                        CGRectGetHeight(self.view.bounds))];
        waveV.waveSpeed = 6.0f;
        waveV.waveAmplitude = 16.0f;
        // _waveView.backgroundColor = [UIColor colorWithHexString:@"#32BAFA" alpha:1];
        [self.view addSubview:waveV];
        [waveV wave];
    }
    
    {
        buttonAnimationV = [[ButtonAnimationV alloc] initWithFrame:CGRectMake(100, 200, 200, 60)];
        buttonAnimationV.center = CGPointMake(self.view.center.x, self.view.center.y + 200);
        buttonAnimationV.delegate = self;
        [self.view addSubview:buttonAnimationV];
    }
    
    {
        leftScrollLabelV = [[ScrollLabelV alloc] initWithFrame:CGRectMake(0, 0, 200, 100)
                                                      withType:SingleDigitType];
        rightScrollLabelV =[[ScrollLabelV alloc] initWithFrame:CGRectMake(0, 0, 200, 100)
                                                      withType:SingleDigitType];
        [self.view addSubview:leftScrollLabelV];
        [self.view addSubview:rightScrollLabelV];
        rightScrollLabelV.center = CGPointMake(self.view.center.x, self.view.center.y - 20);
        leftScrollLabelV.center = CGPointMake(rightScrollLabelV.center.x - 60, self.view.center.y - 20);
        
        UILabel *signLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 80)];
        signLabel.text = @"%";
        signLabel.textAlignment = NSTextAlignmentCenter;
        signLabel.textColor = [UIColor colorWithHexString:@"C4F8FB" alpha:1];
        signLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:60];
        [self.view addSubview:signLabel];
        signLabel.center = CGPointMake(rightScrollLabelV.center.x + 60, self.view.center.y - 20);
    }
    
}

- (void)configureData {
    tens = 0;
    ones = 0;
}

- (void)buttonDidClick {
    NSLog(@"%s", __FUNCTION__);
    ones = ++ones;
    if (ones > 9) {
        tens = ++tens;
        if (tens > 9) {
            tens = 0;
        }
        ones = 0;
    }
    [leftScrollLabelV scollToNum:tens];
    [rightScrollLabelV scollToNum:ones];
}

@end
