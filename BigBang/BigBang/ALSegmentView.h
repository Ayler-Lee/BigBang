//
//  ALSegmentView.h
//  BigBang
//
//  Created by Yale Li on 2017/7/18.
//  Copyright © 2017年 ttpai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALSegmentView : UIView

@property (nonatomic, strong) NSArray *segmentText;

- (instancetype)initWithSegment:(NSArray *)texts;

@end
