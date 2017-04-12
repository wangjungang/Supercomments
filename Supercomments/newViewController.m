//
//  newViewController.m
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/5.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "newViewController.h"
#import "newCell.h"
#import "detailsViewController.h"
#import "SQTopicTableViewController.h"

@interface newViewController ()<UITableViewDataSource,UITableViewDelegate,mycellVdelegate>
@property (nonatomic,strong) UITableView *newtable;
@property (nonatomic,strong) UIImageView *demoimg;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end
static NSString *newidentfid = @"newidentfid";
@implementation newViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491562601265&di=51fbf1320a65a3c5c78945548d3f4543&imgtype=0&src=http%3A%2F%2Fimgcache.mysodao.com%2Fimg1%2FM05%2FAE%2F09%2FCgAPDE9HBDTVnPg5AAhpyG48ies967-dd7e1653.JPG"]]];
    CGRect rect = CGRectMake(0, 80, DEVICE_WIDTH, 200);//创建矩形框
    self.demoimg.frame = rect;
    self.demoimg.image=[UIImage imageWithCGImage:CGImageCreateWithImageInRect([img CGImage], rect)];
    //[self.view addSubview:self.demoimg];
    
    [self.view addSubview:self.newtable];
    
    self.dataSource = [NSMutableArray arrayWithObjects:@"在企业开发中，一些核心技术或者常用框架，出于安全性和稳定性的考虑，不想被外界知道，所以会把核心代码打包成静态库",@"链接时，静态库会被完整地复制到可执行文件中，被多次使用就有多份冗余拷贝链接时，静态库会被完整地复制到可执行文件中，被多次使用就有多份冗余拷贝链接时，静态库会被完整地复制到可执行文件中，被多次使用就有多份冗余拷贝链接时，静态库会被完整地复制到可执行文件中，被多次使用就有多份冗余拷贝",@"链接时，静态库会被完整地复制到可执行文件中，被多次使用就有多份冗余拷贝",@"链接时，静态库会被完整地复制到可执行文件中，被多次使用就有多份冗余拷贝",@"链接时，静态库会被完整地复制到可执行文件中，被多次使用就有多份冗余拷贝", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.newtable.frame = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-64);
    
}

#pragma mark - getters

-(UIImageView *)demoimg
{
    if(!_demoimg)
    {
        _demoimg = [[UIImageView alloc] init];
        
        
    }
    return _demoimg;
}

-(UITableView *)newtable
{
    if(!_newtable)
    {
        _newtable = [[UITableView alloc] init];
        _newtable.dataSource = self;
        _newtable.delegate = self;
    }
    return _newtable;
}

#pragma mark -UITableViewDataSource&&UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [newCell cellHeightWithText:[self p_textAtIndexPath:indexPath]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    newCell *cell = [tableView dequeueReusableCellWithIdentifier:newidentfid];
    if (!cell) {
        cell = [[newCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:newidentfid];
    }
    [cell layoutSubviewsWithText:[self p_textAtIndexPath:indexPath]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
}

- (NSString *)p_textAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self.dataSource objectAtIndex:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    detailsViewController *detailsvc = [[detailsViewController alloc] init];
//    [self.navigationController pushViewController:detailsvc animated:YES];
    SQTopicTableViewController *sqvc = [[SQTopicTableViewController alloc] init];
    [self.navigationController pushViewController:sqvc animated:YES];
}

//点赞
-(void)myTabVClick1:(UITableViewCell *)cell
{
    NSIndexPath *index = [self.newtable indexPathForCell:cell];
    NSLog(@"333===%ld   点赞",index.row);
    
}

//回复
-(void)myTabVClick2:(UITableViewCell *)cell
{
    NSIndexPath *index = [self.newtable indexPathForCell:cell];
    
    NSLog(@"333===%ld   回复",index.row);
}

@end
