//
//  BGATitleButton.m
//  Lottery
//
//  Created by bingoogol on 15/4/24.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGATitleButton.h"
#import <Availability.h>

@implementation BGATitleButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return self;
}

// 不能使用self.titleLabel，因为self.titleLabel内部会调用titleRectForContentRect方法，导致死循环
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleH = contentRect.size.height;
    CGFloat titleW = 0;
    
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:15]};
    titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size.width;
    Logger(@"titleW = %f",titleW);
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageW = 30;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = 0;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end
