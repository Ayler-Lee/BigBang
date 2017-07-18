//
//  ALSegmentScrollView.m
//  BigBang
//
//  Created by Yale Li on 2017/7/18.
//  Copyright © 2017年 ttpai. All rights reserved.
//

#import "ALSegmentScrollView.h"

@implementation ALSegmentScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ --- moved", self.class);
    [super touchesMoved:touches withEvent:event];
}
@end
