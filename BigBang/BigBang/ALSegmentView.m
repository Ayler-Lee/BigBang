//
//  ALSegmentView.m
//  BigBang
//
//  Created by Yale Li on 2017/7/18.
//  Copyright © 2017年 ttpai. All rights reserved.
//

#import "ALSegmentView.h"
#import "ALSegmentButton.h"

@interface ALSegmentView () {
    BOOL _flag;
}
/** 起始是否是选中 */
@property (nonatomic, assign) BOOL startSelect;
/** 记录起始点 */
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, strong) NSMutableArray<ALSegmentButton *> *subButtons;

@end

@implementation ALSegmentView

- (instancetype)initWithSegment:(NSArray *)texts {
    self.segmentText = texts;
    self.backgroundColor = [UIColor redColor];
    return [self initWithFrame:CGRectMake(0, 0, 300, 300)];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    for (int i = 0; i < self.segmentText.count; i++) {
        NSString *text = self.segmentText[i];
        
        ALSegmentButton *button = [[ALSegmentButton alloc] init];
        button.tag = BUTTON_TAG +i;
        button.title = text;
        [self addSubview:button];
        [self.subButtons addObject:button];
    }

}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat margin = 5;
    
    CGFloat x = margin;
    CGFloat y = margin;
    CGFloat buttonW = 0;
    CGFloat buttonH = 0;
    
    for (int i = 0; i < self.subButtons.count; i++) {
        ALSegmentButton *button = self.subButtons[i];
        [button sizeToFit];
        
        button.frame = (CGRect){x, y, button.bounds.size};
        
        if (i >= self.subButtons.count - 1) {
            break;
        }
        
        buttonW = button.bounds.size.width;
        buttonH = button.bounds.size.height;
        
        x += buttonW + margin;
        
        ALSegmentButton *nextButton = self.subButtons[i+1];
        CGFloat nextX = x + nextButton.bounds.size.width + margin;
        if (nextX >= self.bounds.size.width) {
            y += button.bounds.size.height + 15;
            x = margin;
        }
    }
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint startPoint = [touch locationInView:self];
    
    if ([touch.view isKindOfClass:ALSegmentButton.class]) {
        ALSegmentButton *tapButton = (ALSegmentButton *)touch.view;
        self.startSelect = tapButton.selected;
        _flag = YES;
    }

    self.startPoint = startPoint;
    
    LOG_BEGIN(self);
    
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint movePoint = [touch preciseLocationInView:self];
    
    for (ALSegmentButton *button in self.subButtons) {
        CGPoint point = [self convertPoint:movePoint toView:button];
        if ([button pointInside:point withEvent:event]) {
            if (!_flag) {
                self.startSelect = !button.selected;
                _flag = YES;
            }
            button.selected = self.startSelect;
            
        }
    }

    LOG_MOVE;
    
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _flag = NO;
    LOG_END(self);
    
    NSString *text = @"";
    for (ALSegmentButton *button in self.subButtons) {
        if (button.selected) {
            text = [text stringByAppendingString:button.title];
        }
    }
    NSLog(@"%@", text);
    [super touchesEnded:touches withEvent:event];
}

- (NSMutableArray *)subButtons {
    if (_subButtons == nil) {
        _subButtons = [NSMutableArray array];
    }
    return _subButtons;
}
@end
