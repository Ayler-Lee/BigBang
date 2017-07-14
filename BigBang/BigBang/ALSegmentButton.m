//
//  ALSegmentButton.m
//  BigBang
//
//  Created by Yale Li on 2017/7/14.
//  Copyright © 2017年 ttpai. All rights reserved.
//

#import "ALSegmentButton.h"

@implementation ALSegmentButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.layer.cornerRadius = 5;
    self.layer.borderWidth = 0.5;
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    
    self.backgroundColor = [UIColor whiteColor];
    self.adjustsImageWhenHighlighted = NO;

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.selected = !self.selected;
    NSLog(@"button ---- begin");
    [self.nextResponder touchesBegan:touches withEvent:event]; // 传递给下一级响应者 superview 或 viewcontroller
}
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"button %@---- moved", self);
//
//    [self.nextResponder touchesMoved:touches withEvent:event];
//}
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
////    [self.nextResponder touchesEnded:touches withEvent:event];
//    NSLog(@"button ---- end");
//
//}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.backgroundColor = [UIColor cyanColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
}
@end
