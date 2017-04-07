//
//  newCell.h
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/7.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"

@interface newCell : SWTableViewCell
@property (nonatomic,strong) UILabel *namelab;
@property (nonatomic,strong) UILabel *fromlab;
@property (nonatomic,strong) UILabel *contentlab;
@property (nonatomic,strong) UILabel *titlelab;
@property (nonatomic,strong) UILabel *timelab;
@property (nonatomic,strong) UIButton *zanbtn;
@property (nonatomic,strong) UIButton *setbtn;

- (void)layoutSubviewsWithText:(NSString *)text;

+ (CGFloat)cellHeightWithText:(NSString *)text;
@end
