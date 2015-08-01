//
//  ZXResetVC.m
//  致学在线
//
//  Created by zhixue on 15/5/4.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXResetVC.h"

@interface ZXResetVC () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkTextField;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

@end

@implementation ZXResetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavStatus];
    [self setcontent];
}
- (void)setNavStatus
{
    self.navigationItem.title = @"重置密码";
}
- (void)setcontent
{
    self.confirmBtn.layer.masksToBounds = YES;
    self.confirmBtn.layer.cornerRadius = 5;
    self.passwordTextField.delegate = self;
    self.checkTextField.delegate = self;
}
- (IBAction)confirmPassword:(UIButton *)sender
{
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark -判断发送键
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"])
    {
        //        [self.view endEditing:YES];
        NSLog(@"+++");
        return NO;
    }
    return YES;
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
