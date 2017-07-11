//
//  NSString+Extension.h
//  Pin
//
//  Created by cyan on 15/9/12.
//  Copyright © 2015年 cyan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, PINSegmentationOptions) {
    PINSegmentationOptionsNone              = 0,
    PINSegmentationOptionsDeduplication     = 1 << 0,   // 去重
    PINSegmentationOptionsKeepEnglish       = 1 << 1,   // 保留英文
    PINSegmentationOptionsKeepSymbols       = 1 << 2,   // 保留标点
};

@interface NSString (Extension)

- (NSArray<NSString *> *)segment:(PINSegmentationOptions)options;

@end
