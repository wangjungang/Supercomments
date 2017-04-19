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


#include "YMTextData.h"
#import "YMReplyInputView.h"

#import "headModel.h"
#import "pinglunCell.h"
#import "detailcellmodel.h"
@interface detailsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,assign) CGFloat height01;
@property (nonatomic,assign) CGFloat pinglunhei;
@property (nonatomic,strong) NSIndexPath *selectedIndexPath;
@property (nonatomic,strong) detailsheadView *headview;
@property (nonatomic,strong) YMReplyInputView *replyView;
@property (nonatomic,strong) headModel *headm;

@property (nonatomic,strong) UITableView *maintable;

@property (nonatomic,strong) NSMutableArray *detalisarr;
@property (nonatomic,strong) detailcellmodel *detailsmodel;

@end
static NSString *detailsidentfid = @"detailsidentfid";
static NSString *pinglunidentfid = @"pinglunidentfid";
NSMutableArray * ymDataArray;

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
    
    [self loaddetals];
    
    [self loadhead];
    
    
    self.maintable.tableHeaderView = self.headview;
    [self.view addSubview:self.maintable];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

-(void)loaddetals
{
    self.detalisarr = [NSMutableArray array];
    self.detailsmodel = [[detailcellmodel alloc] init];
    for (int i = 0; i<2; i++) {
        self.detailsmodel.namestr = @"1221111";
        self.detailsmodel.timestr = @"22111";
        self.detailsmodel.contstr = @"赵客缦胡缨⑵，吴钩霜雪明⑶。银鞍照白马，飒沓如流星⑷。十步杀一人，千里不留行⑸。事了拂衣去，深藏身与名。闲过信陵饮⑹，脱剑膝前横。将炙啖朱亥，持觞劝侯嬴⑺。";
        self.detailsmodel.pingarr = [NSMutableArray arrayWithObjects:@"其实想直接写 UIScrollView 和 UIView 的 extension 能适应所有视图的才是王道",@"其实想直接写 UIScrollView 和 UIView 的 extension 能适应所有视图的才是王道",@"其实想直接写 UIScrollView 和 UIView 的 extension 能适应所有视图的才是王道", nil];
        
        
        [self.detalisarr addObject:self.detailsmodel];
    }
    [self.maintable reloadData];
}

-(void)loadhead
{
    self.headm = [[headModel alloc] init];
    self.headm.namestr = @"1211111";
    self.headm.contactstr = @"赵客缦胡缨⑵，吴钩霜雪明⑶。银鞍照白马，飒沓如流星⑷。十步杀一人，千里不留行⑸。事了拂衣去，深藏身与名。闲过信陵饮⑹，脱剑膝前横。将炙啖朱亥，持觞劝侯嬴⑺。三杯吐然诺，五岳倒为轻⑻。眼花耳热后，意气素霓生⑼。救赵挥金锤，邯郸先震惊⑽。千秋二壮士，烜赫大梁城。纵死侠骨香，不惭世上英。谁能书阁下，白首太玄经⑾";
    //self.headm.contactstr = @"";
    self.headm.fromstr = @"来自网易老司机的评论";
    self.headm.thumarr = [NSMutableArray arrayWithObjects:@"我都快",@"看电视了",@"敌我诶",@"大爱额外",@"带饿哦 i 绝望",@"但是看见企鹅温柔",@"第五额",@"isaudfj", nil];
    self.headm.imgurlstr = @"123";
    
}

#pragma mark - getters

-(detailsheadView *)headview
{
    if(!_headview)
    {
        _headview = [[detailsheadView alloc] init];
        _headview.layer.masksToBounds = YES;
        _headview.layer.borderWidth = 1;
        [_headview.sharebtn addTarget:self action:@selector(shareclick) forControlEvents:UIControlEventTouchUpInside];
        [_headview.dianzanbtn addTarget:self action:@selector(dianzanclick) forControlEvents:UIControlEventTouchUpInside];
        [_headview.combtn addTarget:self action:@selector(pinglunclick) forControlEvents:UIControlEventTouchUpInside];
        [_headview setheadmodel:_headm];
        CGFloat hei =  [_headview setheadmodel:_headm];
        if (_headm.imgurlstr.length==0) {
            _headview.frame = CGRectMake(0, 0, DEVICE_WIDTH, hei+180*HEIGHT_SCALE);
        }
        else if(_headm.imgurlstr.length!=0&&_headm.contactstr.length==0)
        {
            _headview.frame = CGRectMake(0, 0, DEVICE_WIDTH, hei+380*HEIGHT_SCALE);
        }
        else
        {
             _headview.frame = CGRectMake(0, 0, DEVICE_WIDTH, hei+380*HEIGHT_SCALE);
        }
    }
    
    return _headview;
}


-(UITableView *)maintable
{
    if(!_maintable)
    {
        _maintable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-64)];
        _maintable.dataSource = self;
        _maintable.delegate = self;
        
    }
    return _maintable;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==self.maintable) {
        return 2;
    }
    else
    {
        return 3;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.maintable) {
        detaolsCell *cell = [tableView dequeueReusableCellWithIdentifier:detailsidentfid];
        if (!cell) {
            cell = [[detaolsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailsidentfid];
        }
        cell.pingluntable.dataSource = self;
        cell.pingluntable.delegate = self;
        [cell setcelldata:self.detalisarr[indexPath.row]];
        _height01 = cell.hei;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else
    {
        pinglunCell *cell = [tableView dequeueReusableCellWithIdentifier:pinglunidentfid];
        if (!cell) {
            cell = [[pinglunCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:pinglunidentfid];
            cell.backgroundColor = [UIColor wjColorFloat:@"F4F5F6"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
//        cell.textLabel.text = @"赵客缦胡缨⑵，吴钩霜雪明⑶。银鞍照白马，飒沓如流星⑷。赵客缦胡缨⑵，吴钩霜雪明⑶。银鞍照白马，飒沓如流星⑷赵客缦胡缨⑵，吴钩霜雪明⑶。银鞍照白马，飒沓如流星⑷赵客缦胡缨⑵，吴钩霜雪明⑶。银鞍照白马，飒沓如流星⑷";
        cell.textLabel.text = self.detailsmodel.pingarr[indexPath.row];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.font = [UIFont systemFontOfSize:14*FX];
        CGSize textSize = [cell.textLabel setText:cell.textLabel.text lines:QSTextDefaultLines andLineSpacing:QSTextLineSpacing constrainedToSize:CGSizeMake(DEVICE_WIDTH-64,MAXFLOAT)];
        cell.textLabel.frame = CGRectMake(0, 0, textSize.width, textSize.height);
        _pinglunhei = textSize.height;
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.maintable) {
        
        return 400;
    }
    else
    {
        return _pinglunhei;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.maintable) {
        
    }else
    {
        NSLog(@"跳转评论");
    }
}

#pragma mark - 实现方法

-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)shareclick
{
    NSLog(@"分享");
}

-(void)dianzanclick
{
    NSLog(@"点赞");
}

-(void)pinglunclick
{
    NSLog(@"评论");
}
@end
