//
//  ViewController.m
//  BigBang
//
//  Created by Yale Li on 2017/7/11.
//  Copyright © 2017年 ttpai. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Extension.h"
#import "ALBigBangViewController.h"

int colum = 4; // 列数

static NSString * const testText = @"1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18";

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
}


- (IBAction)bigbang:(UIButton *)sender {
    ALBigBangViewController *vc = [ALBigBangViewController new];
    vc.segmentText = sender.titleLabel.text;
    [self.navigationController pushViewController:vc animated:YES];
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
