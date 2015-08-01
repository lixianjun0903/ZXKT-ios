//
//  ZXProfileHead.m
//  致学在线
//
//  Created by zhixue on 15/4/29.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXProfileHead.h"

@interface ZXProfileHead()
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ZXProfileHead
+ (ZXProfileHead *)tableHeadView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZXProfileHead" owner:nil options:nil] lastObject];
}
- (void)setcontentWithWidth:(CGFloat)width
{
    self.width = width;
}
- (IBAction)clickCourse
{
    NSLog(@"我的课程");
}
- (IBAction)clickQuestion
{
    NSLog(@"我的考试");
}
- (IBAction)clickClass
{
    NSLog(@"我的班级");
}
@end
