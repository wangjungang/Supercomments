//
//  infoViewController.m
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/5.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "infoViewController.h"
#import "infoCell.h"
@interface infoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *infotableview;
@property (nonatomic,strong) NSArray *imgarr;
@property (nonatomic,strong) NSArray *textarr;
@end
static NSString *infocellidentfid = @"infocellidentfid";

@implementation infoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor wjColorFloat:@"333333"];
    
    self.title = @"个人";
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = [UIColor wjColorFloat:@"F5F5F5"];
    [self.view addSubview:self.infotableview];
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

-(UITableView *)infotableview
{
    if(!_infotableview)
    {
        _infotableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT) style:UITableViewStyleGrouped];
        _infotableview.dataSource = self;
        _infotableview.delegate = self;
    }
    return _infotableview;
}

-(NSArray *)imgarr
{
    if(!_imgarr)
    {
        _imgarr = [[NSArray alloc] init];
        _imgarr = @[@"矩形-39",@"帮助与反馈",@"矩形-39"];
    }
    return _imgarr;
}

-(NSArray *)textarr
{
    if(!_textarr)
    {
        _textarr = [[NSArray alloc] init];
        _textarr = @[@"消息通知",@"意见反馈",@"设置"];
    }
    return _textarr;
}

#pragma mark -UITableViewDataSource&&UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    infoCell *cell = [tableView dequeueReusableCellWithIdentifier:infocellidentfid];
    if (!cell) {
        cell = [[infoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:infocellidentfid];
    }
    cell.leftimg.image = [UIImage imageNamed:self.imgarr[indexPath.row]];
    cell.textlab.text = self.textarr[indexPath.row];
    return cell;
}

#pragma mark - 实现方法

-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
