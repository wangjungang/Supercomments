//
//  detailsheadView.h
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/8.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "titleView.h"
#import "zanBtn.h"
#import "commentsBtn.h"
#import "thumbView.h"
@interface detailsheadView : UIView
@property (nonatomic,strong) UILabel *namelab;
@property (nonatomic,strong) UILabel *fromlab;
@property (nonatomic,strong) UILabel *contentlab;
@property (nonatomic,strong) UILabel *numberlab;
@property (nonatomic,strong) titleView *title;
@property (nonatomic,strong) UILabel *timelab;
@property (nonatomic,strong) zanBtn *dianzanbtn;
@property (nonatomic,strong) commentsBtn *combtn;
@property (nonatomic,strong) UIButton *sharebtn;
@property (nonatomic,strong) thumbView *thumview;

@end

