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
    
    
    [_replyDataSource addObject:@"支持富文本并且文本能够收缩和伸展，支持图片，支持图片预览，能够回复，使用非常简单！"];
    [_replyDataSource addObject:@"支持富文本并且文本能够收缩和伸展，支持图片，支持图片预览，能够回复，使用非常简单！"];
    [_replyDataSource addObject:@"支持富文本并且文本能够收缩和伸展，支持图片，支持图片预览，能够回复，使用非常简单！"];
    [_replyDataSource addObject:@"支持富文本并且文本能够收缩和伸展，支持图片，支持图片预览，能够回复，使用非常简单！"];
    
    ymDataArray =[[NSMutableArray alloc]init];
    
    YMTextData *ymData = [[YMTextData alloc] init];
    ymData.showImageArray = _imageDataSource;
    ymData.foldOrNot = YES;
    ymData.showShuoShuo = @"这是DDRichText支持富文本并且文本能够收缩和伸展，支持图片，支持图片预览，能够回复，使用非常简单！支持富文本并且文本能够收缩和伸展，支持图片，支持图片预览，能够回复，使用非常简单！支持富文本并且文本能够收缩和伸展，支持图片，支持图片预览，能够回复，使用非常简单！支持富文本并且文本能够收缩和伸展，支持图片，支持图片预览，能够回复，使用非常简单！";
    
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

-(NSString *)senderName{
    return @"David";
}

-(NSInteger)numberOfRowsInDDRichText{
    //return ymDataArray.count;
    return 2;
}

-(YMTextData *)dataForRowAtIndex:(NSInteger)index{
    return  [ymDataArray objectAtIndex:0];
//    return [ymDataArray objectAtIndex:0];
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
