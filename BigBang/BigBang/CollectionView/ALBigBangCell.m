//
//  ALBigBangCell.m
//  BigBang
//
//  Created by Yale Li on 2017/8/2.
//  Copyright © 2017年 ttpai. All rights reserved.
//

#import "ALBigBangCell.h"

@interface ALBigBangCell ()
@property (nonatomic, weak) UILabel *label;

@end

@implementation ALBigBangCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.backgroundColor = [UIColor orangeColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        self.label = label;
        
//        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
//        [self.contentView addGestureRecognizer:pan];
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    NSLog(@"%@", pan);
//    self.selected = YES;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.label.frame = self.bounds;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.label.textColor = [UIColor whiteColor];
    } else {
        self.label.textColor = [UIColor blackColor];
    }
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    self.label.text = title;
}
@end
