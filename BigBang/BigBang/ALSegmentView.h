//
//  ALSegmentView.h
//  BigBang
//
//  Created by Yale Li on 2017/7/18.
//  Copyright © 2017年 ttpai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALSegmentView;

@protocol ALSegmentViewDelegate <NSObject>

- (void)segmentView:(ALSegmentView *)segmentView didSelectText:(NSString *)text;

@end

@interface ALSegmentView : UIView

@property (nonatomic, weak) id<ALSegmentViewDelegate> delegate;

@property (nonatomic, strong) NSArray *segmentText;

- (instancetype)initWithSegment:(NSArray *)texts;

@end
