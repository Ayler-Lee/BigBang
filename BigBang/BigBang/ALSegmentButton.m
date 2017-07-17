//
//  ALSegmentButton.m
//  BigBang
//
//  Created by Yale Li on 2017/7/14.
//  Copyright © 2017年 ttpai. All rights reserved.
//

#import "ALSegmentButton.h"

@interface ALSegmentButton ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

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
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = self.bounds;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.selected = !self.selected;
    NSLog(@"button ---- begin");
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"button ---- moved");

    [super touchesMoved:touches withEvent:event];
}

- (CGSize)sizeThatFits:(CGSize)size {
    [self.titleLabel sizeToFit];
    NSLog(@"%@", NSStringFromCGSize(self.titleLabel.bounds.size));

    return CGSizeMake(self.titleLabel.bounds.size.width + 20, self.titleLabel.bounds.size.height + 10);
}
- (void)setSelected:(BOOL)selected {
    _selected = selected;
    
    if (selected) {
        self.backgroundColor = [UIColor cyanColor];
        self.titleLabel.textColor = [UIColor whiteColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.textColor = [UIColor blackColor];
    }
}

- (void)setTitle:(NSString *)title {
    _title = title.copy;
    
    self.titleLabel.text = title;
    
}
@end
