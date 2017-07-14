//
//  ALBigBangViewController.m
//  BigBang
//
//  Created by Yale Li on 2017/7/14.
//  Copyright © 2017年 ttpai. All rights reserved.
//

#import "ALBigBangViewController.h"
#import "NSString+Extension.h"
#import "ALSegmentButton.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

static NSString * const testText = @"这是 Pin 里面使用的文本分词功能的代码，哦对了，完全是本地的，准确率有限";

@interface ALBigBangViewController ()

/** 起始是否是选中 */
@property (nonatomic, assign) BOOL startSelect;

@property (nonatomic, assign) CGPoint startPoint;

@property (nonatomic, strong) NSMutableArray *subButtons;

@end

@implementation ALBigBangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor]; //colorWithAlphaComponent:0.5];
    
    NSArray *segmentTexts = [testText segment:PINSegmentationOptionsKeepSymbols];
    
    for (NSString *text in segmentTexts) {
        //        NSLog(@"%@", text);
        ALSegmentButton *button = [[ALSegmentButton alloc] init];
        [button setTitle:text forState:UIControlStateNormal];
        
        [self.view addSubview:button];
        [self.subButtons addObject:button];
    }
    
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat margin = 10;
    
    CGFloat x = margin;
    CGFloat y = 100;
    
    
    for (int i = 0; i < self.subButtons.count; i++) {
        UIButton *button = self.subButtons[i];
        [button sizeToFit];
        CGFloat buttonW = button.bounds.size.width;
        
        button.frame = (CGRect){x, y, button.bounds.size};
        x += buttonW + margin;
        if (x + buttonW >= SCREEN_WIDTH) {
            y += button.bounds.size.height + margin;
            x = 0;
        }
    }
    
}

#pragma mark - 事件响应方法

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint startPoint = [touch preciseLocationInView:self.view];
    self.startPoint = startPoint;
    NSLog(@"%s --- %@", __func__, NSStringFromCGPoint(startPoint));
}

#pragma mark - Getter

- (NSMutableArray *)subButtons {
    if (_subButtons == nil) {
        _subButtons = [NSMutableArray array];
    }
    return _subButtons;
}

@end
