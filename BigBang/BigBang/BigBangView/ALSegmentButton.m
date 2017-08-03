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
    LOG_BEGIN(self);
    
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    LOG_MOVE;
    
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    LOG_END(self);
    
    [super touchesEnded:touches withEvent:event];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize labelSize = [self.titleLabel sizeThatFits:size];
    
//    NSLog(@"%@ -- %@",NSStringFromCGSize(size), NSStringFromCGSize(labelSize));

    return CGSizeMake(labelSize.width + 20, labelSize.height + 10);
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    
    if (selected) {
        self.backgroundColor = [UIColor cyanColor];
        self.titleLabel.textColor = [UIColor whiteColor];
    } else {
        
        [self checkSymbol:self.title];
        self.titleLabel.textColor = [UIColor blackColor];
    }
}

- (void)setTitle:(NSString *)title {
    _title = title.copy;
    
    self.titleLabel.text = title;
    [self checkSymbol:title];
}

- (BOOL)checkSymbol:(NSString *)string {
    
    NSString *symbol = nil;
    [NSMutableCharacterSet punctuationCharacterSet];
    [NSCharacterSet punctuationCharacterSet];
    BOOL isSymbol = [[NSScanner scannerWithString:string] scanCharactersFromSet:[NSCharacterSet punctuationCharacterSet] intoString:&symbol];
//    NSLog(@"%@ -- %@ --- %d", string, symbol, isSymbol);
    if (isSymbol) {
        self.backgroundColor = [UIColor lightGrayColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
    return isSymbol;
}
@end
