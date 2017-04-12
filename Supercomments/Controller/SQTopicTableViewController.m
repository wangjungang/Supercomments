//
//  SQTopicTableViewController.m
//  CommentDemo
//
//  Created by suqianghotel on 16/8/21.
//  Copyright © 2016年 suqianghotel. All rights reserved.
//

#import "SQTopicTableViewController.h"
#import "SQTopicTableViewCell.h"
#import "SQTopicModel.h"
#import "SQCommentModel.h"
#import "SQTopicCellViewModel.h"
#import "SQCommentModel.h"
#import "SQCommentCellViewModel.h"
#import "SQUserCenterViewController.h"

@interface SQTopicTableViewController ()<SQTopicTableViewCellDelegate>
@property(nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation SQTopicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor wjColorFloat:@"333333"];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor wjColorFloat:@"333333"]}];
    
    self.title = @"详情";
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = [UIColor wjColorFloat:@"F5F5F5"];
    
    
    
    
    ///--------------- 假数据start
//    NSString *content = @"决赛中面对塞尔维亚的强有力挑战，中国女排在先输一局的情况下加强发球和拦网，连扳三局3-1逆转获胜，时隔12年再度荣膺奥运冠军";
//    NSString *content1 = @"决赛中面对塞尔维亚的强有力挑战\n中国女排在先输一局的情况下加强发球和拦网，连扳三局3-1逆转获胜，\n时隔12年再度荣膺奥运";
//    
//    NSRange range = NSMakeRange(0, content.length);
//    
//    NSRange range1 = NSMakeRange(0, content1.length);
    
    NSMutableArray *topicModels = [NSMutableArray array];
    
    SQTopicModel *topic = nil;
    for (int i = 0; i < 50; i++) {
        topic = [[SQTopicModel alloc] init];
        topic.icon = @"http://img3.duitang.com/uploads/item/201604/24/20160424132044_ZzhuX.jpeg";
        
        topic.userame = [NSString stringWithFormat:@"张%d", i];
        
        topic.content = @"拜仁慕尼黑，罗本里贝罗，哈维阿隆索，拉姆";
        
        int commnentCount = arc4random_uniform(20);
        
        NSMutableArray *commentModels = [NSMutableArray array];
        
        SQCommentModel *commentModel = nil;
        for (int j = 0; j < commnentCount; j++) {
            commentModel = [[SQCommentModel alloc] init];
            
            commentModel.from = [NSString stringWithFormat:@"李%d", j];
            if (j % 4 == 0) {
                commentModel.to = topic.userame;
            }
            
            //int index = arc4random_uniform(range.length);
            
           // commentModel.content = [content substringFromIndex:index];
            commentModel.content = @"加油拜仁";
            [commentModels addObject:commentModel];
        }
        
        topic.commentModels = commentModels.copy;
        
        [topicModels addObject:topic];
    
    }
    ///--------------- 假数据end
    
    
    
    for (int i = 0; i < topicModels.count; i++) {
        SQTopicCellViewModel *viewModel = [[SQTopicCellViewModel alloc] init];
        
        viewModel.topicModel = topicModels[i];
        
        [self.dataArray addObject:viewModel];
    }
    
    
    [self.tableView registerClass:[SQTopicTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.tableView reloadData];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    SQTopicCellViewModel *topicViewModel = self.dataArray[indexPath.row];
    
    return topicViewModel.cellHeight;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SQTopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull SQTopicTableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    cell.topicViewModel = self.dataArray[indexPath.row];

}


# pragma mark - cell事件代理
- (void)cell:(SQTopicTableViewCell *)cell didUserClicked:(NSString *)username{
    NSLog(@"点击了%@, 可以跳转个人中心", username);
    
    SQUserCenterViewController *usercenterVC = [[SQUserCenterViewController alloc] init];
    
    usercenterVC.title = username;
    
    [self.navigationController pushViewController:usercenterVC animated:YES];
}

- (void)cell:(SQTopicTableViewCell *)cell didReplyClicked:(SQCommentModel *)commentModel{
    NSLog(@"这里可以回复%@", commentModel.from);
}

- (void)cellToggleExpentContent:(SQTopicTableViewCell *)cell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    SQTopicCellViewModel *viewModel = self.dataArray[indexPath.row];
    SQTopicCellViewModel *newViewModel = [[SQTopicCellViewModel alloc] init];
    
    viewModel.topicModel.expanded = !viewModel.topicModel.expanded;
    newViewModel.topicModel = viewModel.topicModel;
    
    [self.dataArray replaceObjectAtIndex:indexPath.row withObject:newViewModel];
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

#pragma mark - 实现方法

-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
