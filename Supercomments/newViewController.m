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


#import "YYPhotoGroupView.h"
//#import "YYFPSLabel.h"
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
                //self.nmodel.contentstr = dicarr[@"content"];
                self.nmodel.contentstr = @"";
                self.nmodel.timestr = dicarr[@"create_time"];
                self.nmodel.imgurlstr = dicarr[@"images"];
                self.nmodel.imgurlstr = @"http://baiduapp.changweibo.net/user_img/2017/0415/14362936404.png";
                
                self.nmodel.namestr = dicarr[@"name"];
                self.nmodel.dianzanstr = dicarr[@"support_num"];
                self.nmodel.pinglunstr = dicarr[@"reply_num"];
              
                
              
                [self.dataSource addObject:self.nmodel.contentstr];
                [self.dataarr addObject:self.nmodel];
                
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.newtable reloadData];
                });
         
        }
    } errorblock:^(NSError *error) {
        
    }];

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
    
    if (self.nmodel.imgurlstr.length==0) {
        return [newCell cellHeightWithText:self.dataSource[indexPath.row]]+(16+14+16+4+20+16+16)*HEIGHT_SCALE;
    }
    else if(self.nmodel.contentstr.length==0&&self.nmodel.imgurlstr.length!=0)
    {
        return (16+14+16+4+20+16+16+196)*HEIGHT_SCALE;
    }
    else
    {
         return [newCell cellHeightWithText:self.dataSource[indexPath.row]]+(16+14+16+4+20+16+16+14+196)*HEIGHT_SCALE;
    }
    return 0;
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



@end
