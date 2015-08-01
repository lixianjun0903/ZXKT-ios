//
//  ZXMeTableVC.m
//  致学在线
//
//  Created by zhixue on 15/4/29.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMeTableVC.h"
#import "ZXProfileHead.h"
#import "ZXLoginVC.h"
#import "ZXCustomNavigation.h"

@interface ZXMeTableVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *customTableView;
@property (nonatomic,strong)NSArray *cellIconArray;
@property (nonatomic,strong)NSArray *cellTitleArray;
@end

@implementation ZXMeTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavStatus];
    [self setTableView];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [btn setTitle:@"登陆" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}
- (void)push
{
    [self presentViewController:[[ZXCustomNavigation alloc] initWithRootViewController:[[ZXLoginVC alloc] init]] animated:YES completion:nil];
}
- (void)setNavStatus
{
    self.navigationItem.title = @"个人中心";
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 20)];
    statusBarView.backgroundColor = color(235, 67, 67);
    [self.view addSubview:statusBarView];
}
- (void)setTableView
{
    UITableView *customTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height)];
    customTableView.dataSource = self;
    customTableView.delegate = self;
    customTableView.scrollEnabled = YES;
    customTableView.tableFooterView = [[UIView alloc] init];
    customTableView.scrollEnabled = NO;
    [customTableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, -20)];
    
    ZXProfileHead *tableHeadView = [ZXProfileHead tableHeadView];
    [tableHeadView setcontentWithWidth:self.view.width];
    customTableView.tableHeaderView = tableHeadView;
    customTableView.tableFooterView = [[UIView alloc] init];
    
    self.customTableView = customTableView;
    [self.view addSubview:customTableView];
    
     self.cellIconArray = [NSArray arrayWithObjects:@"profile_archive", @"profile_download", @"profile_collect", @"profile_message", @"profile_set",@"profile_about",nil];
    self.cellTitleArray = [NSArray arrayWithObjects:@"我的档案", @"我的下载", @"我的收藏", @"消息提醒", @"系统设置",@"关于我们",nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark -
#pragma mark Tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 2 ? 0:3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"HomeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSInteger index = indexPath.section * 3 + indexPath.row;
    cell.textLabel.text = self.cellTitleArray[index];
    cell.imageView.image = [UIImage imageNamed:self.cellIconArray[index]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
#pragma mark -
#pragma mark Tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].selectionStyle = UITableViewCellSelectionStyleNone;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([UIScreen mainScreen].bounds.size.height == 568)
    {
        return 44;
    }
    return 60;
}
@end
