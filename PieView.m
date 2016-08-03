//
//  PieView.m
//  test
//
//  Created by Mr.Yang on 16/8/3.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "PieView.h"

@implementation ProModel
-(UIColor *)color {
    if (!_color) {
        _color = [UIColor whiteColor];
    }
    return _color;
}

@end


@interface PieView()

@property (nonatomic, assign)double totalPercent;

@property (nonatomic, assign)double radius;

@end

@implementation PieView

-(instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 100, 100);
        self.backgroundColor = [UIColor greenColor];
        self.totalPercent = 0;
        self.radius = 50.0;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        self.totalPercent = 0;
        self.radius = (frame.size.width > frame.size.height ? frame.size.height : frame.size.width) / 2.0;
    }
    return self;
}

- (void)setArray:(NSMutableArray *)array {
    if (0 == array.count) {
        return;
    }
    
    if (![self checkArray:array]) {
        return;
    }
    _array = array;
}

//检测数组是否符合实际
- (BOOL)checkArray:(NSMutableArray *)array {
    self.totalPercent = 0;
    for (int i = 0; i < array.count; i++) {
        
        if (![array[i] isKindOfClass:[ProModel class]]) {
            return NO;
        }
        ProModel * model = array[i];
        if (model.percent <= 0) {
            return NO;
        }
        self.totalPercent += model.percent;
    }
    if (self.totalPercent > 100.0) {
        return NO;
    }
    [self setNeedsDisplay];
    return YES;
}


//绘图步骤
-(void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;

    self.totalPercent = 0;
    for (ProModel * mode in self.array) {
        UIBezierPath * be = [[UIBezierPath alloc] init];
        [be addArcWithCenter:center
                             radius:self.radius / 2.0
                         startAngle:M_PI * self.totalPercent / 50.0
                           endAngle:M_PI * (self.totalPercent + mode.percent) / 50
                          clockwise:YES];
        be.lineWidth = self.radius;
        [mode.color setStroke];
        [be stroke];
        self.totalPercent += mode.percent;
    }
}

@end
