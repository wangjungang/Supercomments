//
//  detaolsCell.h
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/8.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detaolsCell : UITableViewCell
@property (nonatomic,assign) CGFloat hei;
@property (nonatomic,assign) CGFloat hei2;

@property (nonatomic,strong) UIImageView *picimg;
@property (nonatomic,strong) UILabel *namelab;
@property (nonatomic,strong) UILabel *timelab;
@property (nonatomic,strong) UILabel *contentlab;

@property (nonatomic,strong) UILabel *pinglunlab;
@end
