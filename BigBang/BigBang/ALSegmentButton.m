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
//    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 0.5;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    
    self.backgroundColor = [UIColor whiteColor];
    
//    [self addTarget:self action:@selector(buttonSelect:) forControlEvents:UIControlEventTouchUpInside];
//    [self addTarget:self action:@selector(buttonSelectCancel:) forControlEvents:UIControlEventTouchCancel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.selected = !self.selected;
}
- (void)buttonSelect:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (void)buttonSelectCancel:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (void)setHighlighted:(BOOL)highlighted {
//    [super setHighlighted:highlighted];
//    if (highlighted) {
//        self.backgroundColor = [UIColor redColor];
//    } else {
//        self.backgroundColor = [UIColor whiteColor];
//    }
//
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.backgroundColor = [UIColor cyanColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
}
@end
