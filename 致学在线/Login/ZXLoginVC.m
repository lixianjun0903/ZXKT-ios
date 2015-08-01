//
//  ZXLoginVC.m
//  致学在线
//
//  Created by zhixue on 15/4/30.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXLoginVC.h"
#import "ZXEnrollVC.h"
#import "ZXSeekVC.h"

@interface ZXLoginVC () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ZXLoginVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavStatus];
    [self setContent];
}
- (void)setNavStatus
{
    
    self.navigationItem.title = @"登陆";
    
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(newUser) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:registerBtn];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backBtn setTitle:@"取消" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}
- (void)setContent
{
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.layer.cornerRadius = 5;
    self.username.delegate = self;
    self.password.delegate = self;
    
    self.username.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *userNameView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    userNameView.contentMode = UIViewContentModeCenter;
    userNameView.image = [UIImage imageNamed:@"login_user"];
    self.username.leftView = userNameView;
    
    self.password.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *passWordView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    passWordView.contentMode = UIViewContentModeCenter;
    passWordView.image = [UIImage imageNamed:@"login_lock"];
    self.password.leftView = passWordView;
    
    self.password.rightViewMode = UITextFieldViewModeAlways;
    UIButton *passWordRightView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    passWordRightView.contentMode = UIViewContentModeCenter;
    [passWordRightView setImage:[UIImage imageNamed:@"login_password_hiden"] forState:UIControlStateNormal];
    [passWordRightView setImage:[UIImage imageNamed:@"login_password_show"] forState:UIControlStateSelected];
    [passWordRightView addTarget:self action:@selector(exchangePasswordStatus:) forControlEvents:UIControlEventTouchUpInside];
    self.password.rightView = passWordRightView;
}
#pragma mark -注册
- (void)newUser
{
    [self.navigationController pushViewController:[[ZXEnrollVC alloc] init] animated:YES];
}
#pragma mark -返回
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark -密码可见不可见
- (void)exchangePasswordStatus:(UIButton *)btn
{
    btn.selected = !btn.selected;
    self.password.secureTextEntry = !self.password.secureTextEntry;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark -记住密码
- (IBAction)rememberPassword:(UIButton *)btn
{
    btn.selected = !btn.selected;
}
#pragma mark -自动登陆
- (IBAction)autoLogin:(UIButton *)btn
{
    btn.selected = !btn.selected;
}
#pragma mark -登陆
- (IBAction)login:(UIButton *)sender
{
    
}
#pragma mark -忘记密码
- (IBAction)forgetPassword:(UIButton *)sender
{
     [self.navigationController pushViewController:[[ZXSeekVC alloc] init] animated:YES];
}
#pragma mark -
#pragma mark -判断发送键
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"])
    {
        [self.view endEditing:YES];
        return NO;
    }
    return YES;
}
@end
