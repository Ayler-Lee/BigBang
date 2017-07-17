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

static NSString * const testText = @"现实的精华就是匮乏，一种普遍而永恒的欠缺。这个世界上的一切都不够人们受用。食物不够，爱不够，正义不够，时间永远不够。即使我们有了足够的钱、时间和爱，我们找到了和这个世界和谐相处的方法，安宁很快会变成无聊。无聊很快会变成一种新的匮乏，欲望的匮乏。";

@interface ALBigBangViewController ()

/** 起始是否是选中 */
@property (nonatomic, assign) BOOL startSelect;

@property (nonatomic, assign) CGPoint startPoint;

@property (nonatomic, strong) NSMutableArray<ALSegmentButton *> *subButtons;

@end

@implementation ALBigBangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor]; //colorWithAlphaComponent:0.5];
    
    NSArray *segmentTexts = [testText segment:PINSegmentationOptionsKeepSymbols];
    
    for (NSString *text in segmentTexts) {
        
        ALSegmentButton *button = [[ALSegmentButton alloc] init];
        button.title = text;
        [self.view addSubview:button];
        [self.subButtons addObject:button];
    }
    
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat margin = 5;
    
    CGFloat x = margin;
    CGFloat y = 100;
    
    
    for (int i = 0; i < self.subButtons.count; i++) {
        ALSegmentButton *button = self.subButtons[i];
        [button sizeToFit];
        
        button.frame = (CGRect){x, y, button.bounds.size};
        if (i >= self.subButtons.count-1) {
            break;
        }
        
        CGFloat buttonW = button.bounds.size.width;
        x += buttonW + margin;
        
        ALSegmentButton *nextButton = self.subButtons[i+1];
        CGFloat nextX = x + nextButton.bounds.size.width + margin;
        if (nextX >= SCREEN_WIDTH) {
            y += button.bounds.size.height + 15;
            x = margin;
        }
    }
    
}

#pragma mark - 事件响应方法

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint startPoint = [touch locationInView:self.view];
    
    if ([touch.view isKindOfClass:ALSegmentButton.class]) {
        ALSegmentButton *tapButton = (ALSegmentButton *)touch.view;
        self.startSelect = tapButton.selected;
    }
//    self.startSelect = !self.startSelect;
    self.startPoint = startPoint;
    NSLog(@"%s --- %@", __func__, NSStringFromCGPoint(startPoint));
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint movePoint = [touch preciseLocationInView:self.view];
    
    for (UIButton *button in self.subButtons) {
        CGPoint point = [self.view convertPoint:movePoint toView:button];
//        NSLog(@"%@ --- %@", NSStringFromCGPoint(movePoint), NSStringFromCGPoint(point));
        if ([button pointInside:point withEvent:event]) {
            button.selected = self.startSelect;
            NSLog(@"%@", button);
        }
    }
//    CGPoint offset = CGPointMake(movePoint.x - self.startPoint.x, movePoint.y - self.startPoint.y);
//    NSLog(@"%s --- %@", __func__, NSStringFromCGPoint(offset));

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint endPoint = [touch preciseLocationInView:self.view];
    NSLog(@"%s --- %@", __func__, NSStringFromCGPoint(endPoint));
}
#pragma mark - Getter

- (NSMutableArray *)subButtons {
    if (_subButtons == nil) {
        _subButtons = [NSMutableArray array];
    }
    return _subButtons;
}

@end
