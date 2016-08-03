//
//  PieView.h
//  test
//
//  Created by Mr.Yang on 16/8/3.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ProModel : NSObject

@property (nonatomic, strong)UIColor * color;//区域颜色
@property (nonatomic, assign)double percent;//百分比 最多100

@end


@interface PieView : UIView

@property (nonatomic, copy)NSMutableArray * array;//数组

@end


/* 使用方法
 NSMutableArray * array = [NSMutableArray arrayWithCapacity:0];
 ProModel * mode = [[ProModel alloc] init];
 mode.color = [UIColor yellowColor];
 mode.percent = 40;
 [array addObject:mode];
 
 ProModel * mode2 = [[ProModel alloc] init];
 mode2.color = [UIColor redColor];
 mode2.percent = 30;
 [array addObject:mode2];
 
 ProModel * mode3 = [[ProModel alloc] init];
 mode3.color = [UIColor blueColor];
 mode3.percent = 30;
 [array addObject:mode3];
 
 PieView * pie = [[PieView alloc] initWithFrame:CGRectMake(10, 250, 400, 400)];
 [self.view addSubview:pie];
 pie.array = array;
 */