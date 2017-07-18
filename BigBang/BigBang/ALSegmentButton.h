//
//  ALSegmentButton.h
//  BigBang
//
//  Created by Yale Li on 2017/7/14.
//  Copyright © 2017年 ttpai. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BUTTON_TAG 1000

@interface ALSegmentButton : UIView

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger tag;
@end
