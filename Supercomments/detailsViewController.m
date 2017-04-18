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
@interface detailsViewController ()<UITableViewDataSource,UITableViewDelegate,DDRichTextViewDataSource,DDRichTextViewDelegate,InputDelegate>

@property (nonatomic,strong) NSIndexPath *selectedIndexPath;

@property (nonatomic,strong) UITableView *detailsTable;
@property (nonatomic,strong) detailsheadView *headview;
@property (nonatomic,strong) YMReplyInputView *replyView;

@property (nonatomic,strong) headModel *headm;
@end
static NSString *detailsidentfid = @"detailsidentfid";
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

    
    [self loadhead];
    
    
    mainTable.tableHeaderView = self.headview;
    
    //图片支持网络异步加载
    NSMutableArray *_imageDataSource = [NSMutableArray arrayWithCapacity:0];
    
    NSMutableArray *_replyDataSource = [[NSMutableArray alloc] init];//回复数据来源
    [_replyDataSource addObject:@"@Della:@戴伟来 DDRichText棒棒哒！ @daiweilai： @daiweilai @戴伟来:I am Della，这是一个IOS库[em:01:][em:02:][em:03:]"];
    [_replyDataSource addObject:@"这是一个IOS库[em:01:][em:02:][em:03:]"];
    ymDataArray =[[NSMutableArray alloc]init];
    
    YMTextData *ymData = [[YMTextData alloc] init];
    ymData.showImageArray = _imageDataSource;
    ymData.foldOrNot = YES;
    ymData.showShuoShuo = @"这是DDRichText！！支持富文本并且文本能够收缩和伸展，支持图片，支持图片预览，能够回复，使用非常简单！！，这是一个电话号码13800138000，我是@戴伟来 @daiweilai： @daiweilai @戴伟来:支持自定义表情[em:01:] [em:02:] [em:03:] 这是一个网址https://github.com/daiweilai 也支持自定义位置的富文本点击！";
    ymData.replyDataSource = _replyDataSource;
    ymData.name = @"David";
    ymData.intro = @"2015-2-8";
    ymData.headPicURL = @"https://octodex.github.com/images/mummytocat.gif";
    [ymDataArray addObject:ymData];
    self.delegate = self;
    self.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
}

-(void)loadhead
{
    self.headm = [[headModel alloc] init];
    self.headm.namestr = @"1211111";
    self.headm.contactstr = @"12dsjakdlkjdfhajsklfd";
    
}

#pragma mark - getters

-(detailsheadView *)headview
{
    if(!_headview)
    {
        _headview = [[detailsheadView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 450)];
        _headview.layer.masksToBounds = YES;
        _headview.layer.borderWidth = 1;
        [_headview.sharebtn addTarget:self action:@selector(shareclick) forControlEvents:UIControlEventTouchUpInside];
        [_headview.dianzanbtn addTarget:self action:@selector(dianzanclick) forControlEvents:UIControlEventTouchUpInside];
        [_headview.combtn addTarget:self action:@selector(pinglunclick) forControlEvents:UIControlEventTouchUpInside];
        
        [_headview setheadmodel:_headm];
    }
    return _headview;
}

-(NSString *)senderName{
    return @"David";
}

-(NSInteger)numberOfRowsInDDRichText{
    return 5;
}

-(YMTextData *)dataForRowAtIndex:(NSInteger)index{
    return [ymDataArray objectAtIndex:0];
}

-(BOOL)hideReplyButtonForIndex:(NSInteger)index{
    return NO;
}

-(void)didPromulgatorNameOrHeadPicPressedForIndex:(NSInteger)index name:(NSString *)name{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"发布者回调" message:[NSString stringWithFormat:@"姓名：%@\n index：%d",name,index] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
 //   [alert show];
}

-(void)didRichTextPressedFromText:(NSString*)text index:(NSInteger)index{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"正文富文本点击回调" message:[NSString stringWithFormat:@"点击的内容：%@\n index：%d",text,index] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    [alert show];
}

-(void)didRichTextPressedFromText:(NSString *)text index:(NSInteger)index replyIndex:(NSInteger)replyIndex{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"评论的富文本点击回调" message:[NSString stringWithFormat:@"点击的内容：%@\n index：%d \n replyIndex:%d",text,index,replyIndex] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    [alert show];
    NSLog(@"评论");
    _replyView = [[YMReplyInputView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, screenWidth,44) andAboveView:self.view];
    _replyView.delegate = self;
   // _replyView.replyTag = sender.tag;
    [self.view addSubview:_replyView];
}

-(void)replyForIndex:(NSInteger)index replyText:(NSString*)text{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"回复的回调" message:[NSString stringWithFormat:@"回复的内容：%@\n index：%d",text,index] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    [alert show];
    
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
