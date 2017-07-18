//
//  ALBigBangViewController.m
//  BigBang
//
//  Created by Yale Li on 2017/7/14.
//  Copyright © 2017年 ttpai. All rights reserved.
//

#import "ALBigBangViewController.h"
#import "NSString+Extension.h"
//#import "ALSegmentButton.h"
#import "ALSegmentScrollView.h"
#import "ALSegmentView.h"


static NSString * const testText = @"现实的精华就是匮乏，一种普遍而永恒的欠缺。这个世界上的一切都不够人们受用。食物不够，爱不够，正义不够，时间永远不够。即使我们有了足够的钱、时间和爱，我们找到了和这个世界和谐相处的方法，安宁很快会变成无聊。无聊很快会变成一种新的匮乏，欲望的匮乏。";

@interface ALBigBangViewController ()<UIScrollViewDelegate>




@property (nonatomic, strong) ALSegmentScrollView *scrollView;
@property (nonatomic, strong) ALSegmentView *segmentView;

@end

@implementation ALBigBangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor]; //colorWithAlphaComponent:0.5];
    self.navigationController.navigationBar.translucent = NO;
    
//    [self.view addSubview:self.scrollView];
    
    NSArray *segmentTexts = [testText segment:PINSegmentationOptionsKeepSymbols];
    
    self.segmentView = [[ALSegmentView alloc] initWithSegment:segmentTexts];
    [self.view addSubview:self.segmentView];
    
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
//    self.scrollView.frame = CGRectInset(self.view.bounds, 10, 10);

   
    
//    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width, y + buttonH + 15);
}

#pragma mark - 事件响应方法




- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint endPoint = [touch preciseLocationInView:self.view];
    NSLog(@"%s --- %@", __func__, NSStringFromCGPoint(endPoint));
}
#pragma mark - Getter

- (ALSegmentScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[ALSegmentScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.9];
        _scrollView.delegate = self;
    }
    return _scrollView;
}



@end
