//
//  detailsViewController.m
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/8.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "detailsViewController.h"
#import "detaolsCell.h"
#import "detailsheadView.h"
@interface detailsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *detailsTable;
@property (nonatomic,strong) detailsheadView *headview;
@end
static NSString *detailsidentfid = @"detailsidentfid";
@implementation detailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor wjColorFloat:@"333333"];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor wjColorFloat:@"333333"]}];

    self.title = @"详情";
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = [UIColor wjColorFloat:@"F5F5F5"];
    
    [self.view addSubview:self.detailsTable];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

#pragma mark - getters

-(UITableView *)detailsTable
{
    if(!_detailsTable)
    {
        _detailsTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-64) style:UITableViewStylePlain];
        _detailsTable.dataSource = self;
        _detailsTable.delegate = self;
        _detailsTable.tableHeaderView = self.headview;
    }
    return _detailsTable;
}

-(detailsheadView *)headview
{
    if(!_headview)
    {
        _headview = [[detailsheadView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 450)];
        _headview.layer.masksToBounds = YES;
        _headview.layer.borderWidth = 1;
    }
    return _headview;
}

#pragma mark -UITableViewDataSource&&UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    detaolsCell *cell = [tableView dequeueReusableCellWithIdentifier:detailsidentfid];
    if (!cell) {
        cell = [[detaolsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailsidentfid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80*HEIGHT_SCALE;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

#pragma mark - 实现方法

-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
