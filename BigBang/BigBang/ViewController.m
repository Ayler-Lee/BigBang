//
//  ViewController.m
//  BigBang
//
//  Created by Yale Li on 2017/7/11.
//  Copyright © 2017年 ttpai. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Extension.h"

static NSString * const testText = @"这是 Pin 里面使用的文本分词功能的代码，哦对了，完全是本地的，准确率有限";
//static NSString * const testText = @"1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18";
int colum = 4; // 列数

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *subButtons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *segmentTexts = [testText segment:PINSegmentationOptionsKeepSymbols];
    
    for (NSString *text in segmentTexts) {
//        NSLog(@"%@", text);
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:text forState:UIControlStateNormal];
        button.backgroundColor = [UIColor cyanColor];
        [button sizeToFit];
        [self.view addSubview:button];
        [self.subButtons addObject:button];
    }
    
    
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGFloat x = 0;
    CGFloat y = 100;
    
    CGFloat margin = 5;
    
    for (int i = 0; i < self.subButtons.count; i++) {
        UIButton *button = self.subButtons[i];
        CGFloat buttonW = button.bounds.size.width;
        
        button.frame = (CGRect){x, y, button.bounds.size};
        x += buttonW + margin;
        if (x >= colum * buttonW) {
            y += button.bounds.size.height + margin;
            x = 0;
        }
    }

}

- (NSMutableArray *)subButtons {
    if (_subButtons == nil) {
        _subButtons = [NSMutableArray array];
    }
    return _subButtons;
}

/** 数组的蛇形排序 */
- (void)sortSegment {
    
    NSMutableArray *segmentTexts = [[testText segment:PINSegmentationOptionsKeepSymbols] mutableCopy];
    NSMutableArray *sortArr = nil;
    
    for (int i = 0; i < segmentTexts.count; i++) {
        
        int rowIndex = i / colum; // 行号
        int lineIndex = i % colum; // 列号
        
        /** 奇数行进行排序, 第0列创建数组, 第 n 列排序并替换元素 */
        if (rowIndex % 2 != 0) { // 奇数行
            NSString *num = segmentTexts[i];
            NSLog(@"%@", num);
            if (lineIndex % colum == 0) { // 第0列
                sortArr = [NSMutableArray arrayWithCapacity:colum];
            }
            
            [sortArr addObject:num];
            
            if (lineIndex % colum == colum - 1) { // 最后列
                [sortArr sortUsingComparator:^NSComparisonResult(NSString  * obj1, NSString  * obj2) {
                    return obj2.integerValue > obj1.integerValue;
                }];
                
                NSRange range = NSMakeRange(i - colum + 1, colum);
                [segmentTexts replaceObjectsInRange:range withObjectsFromArray:sortArr];
                NSLog(@"%@", sortArr);
            }
            
        }
    }
}

@end
