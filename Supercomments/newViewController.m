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
#import "XWScanImage.h"
#import "newModel.h"
@interface newViewController ()<UITableViewDataSource,UITableViewDelegate,mycellVdelegate>
@property (nonatomic,strong) UITableView *newtable;
@property (nonatomic,strong) UIImageView *demoimg;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) NSMutableArray *dataarr;
@property (nonatomic,strong) newModel *nmodel;
@property (nonatomic,strong) NSMutableArray *heiarr;
@end
static NSString *newidentfid = @"newidentfid";
@implementation newViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataarr = [NSMutableArray array];
    self.heiarr = [NSMutableArray array];
    self.dataSource = [NSMutableArray array];
    [self loaddatafromweb];
    
    [self.view addSubview:self.newtable];
    
}

-(void)loaddatafromweb
{
    
    [AFManager getReqURL:newVCload block:^(id infor) {
        NSLog(@"info====%@",infor);
      
            NSArray *dit = [infor objectForKey:@"info"];
            NSLog(@"ddjdjdjdj----%lu",(unsigned long)dit.count);
            for (int i = 0; i<dit.count; i++) {
                
                NSDictionary *dicarr = [dit objectAtIndex:i];
                self.nmodel = [[newModel alloc] init];
                self.nmodel.contentstr = dicarr[@"content"];
                self.nmodel.timestr = dicarr[@"create_time"];
                self.nmodel.imgurlstr = dicarr[@"images"];
                self.nmodel.namestr = dicarr[@"name"];
                self.nmodel.dianzanstr = dicarr[@"support_num"];
                self.nmodel.pinglunstr = dicarr[@"reply_num"];
                if (self.nmodel.imgurlstr!=nil||self.nmodel.imgurlstr!=NULL) {
                    self.nmodel.hei = @"50";
                }
                else
                {
                    self.nmodel.hei = @"140";
                }
                
                [self.heiarr addObject:self.nmodel.hei];
                [self.dataSource addObject:self.nmodel.contentstr];
                [self.dataarr addObject:self.nmodel];
                
                
                
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.newtable reloadData];
            });
        }
    } errorblock:^(NSError *error) {
        
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.newtable reloadData];
    });

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
    
   // return [self.heiarr[indexPath.row] floatValue];
    
    return [newCell cellHeightWithText:self.dataSource[indexPath.row]]+120*HEIGHT_SCALE;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataarr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    newCell *cell = [tableView dequeueReusableCellWithIdentifier:newidentfid];
    if (!cell) {
        cell = [[newCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:newidentfid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    
    [cell setcelldata:self.dataarr[indexPath.row]];
    //为UIImageView1添加点击事件
    UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scanBigImageClick:)];
    [cell.infoimg addGestureRecognizer:tapGestureRecognizer1];
    //让UIImageView和它的父类开启用户交互属性
    [cell.infoimg setUserInteractionEnabled:YES];
    return cell;
}

- (NSString *)p_textAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self.dataSource objectAtIndex:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    detailsViewController *detailsvc = [[detailsViewController alloc] init];
    [self.navigationController pushViewController:detailsvc animated:YES];
//    SQTopicTableViewController *sqvc = [[SQTopicTableViewController alloc] init];
//    [self.navigationController pushViewController:sqvc animated:YES];
    
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

#pragma mark - 浏览大图点击事件

-(void)scanBigImageClick:(UITapGestureRecognizer *)tap{
    NSLog(@"点击图片");
    UIImageView *clickedImageView = (UIImageView *)tap.view;
    [XWScanImage scanBigImageWithImageView:clickedImageView];
   
}

@end
