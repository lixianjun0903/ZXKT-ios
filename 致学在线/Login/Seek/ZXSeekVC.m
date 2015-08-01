//
//  ZXSeekVC.m
//  致学在线
//
//  Created by zhixue on 15/5/4.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXSeekVC.h"
#import "ZXResetVC.h"

@interface ZXSeekVC ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextStep;

@end

@implementation ZXSeekVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavStatus];
    [self setcontent];
}
- (void)setNavStatus
{
    self.navigationItem.title = @"找回密码";
}
- (void)setcontent
{
    self.phoneTextField.leftViewMode = UITextFieldViewModeAlways;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 40)];
    label.text = @"+86";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = color(153, 153, 153);
    self.phoneTextField.leftView = label;
    
    self.checkTextField.rightViewMode = UITextFieldViewModeAlways;
    UIButton *checkBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [checkBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [checkBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [checkBtn setBackgroundColor:color(153, 153, 153)];
    checkBtn.layer.masksToBounds = YES;
    checkBtn.layer.cornerRadius = 5;
    checkBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [checkBtn addTarget:self action:@selector(getCheckNumber) forControlEvents:UIControlEventTouchUpInside];
    self.checkTextField.rightView = checkBtn;
    
    self.nextStep.layer.masksToBounds = YES;
    self.nextStep.layer.cornerRadius = 5;
}
- (void)getCheckNumber
{
    NSLog(@"获取验证码");
}
- (IBAction)nextStep:(UIButton *)sender
{
    [self.navigationController pushViewController:[[ZXResetVC alloc] init] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
