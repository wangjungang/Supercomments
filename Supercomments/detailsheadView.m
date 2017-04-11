//
//  detailsheadView.m
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/8.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "detailsheadView.h"

@interface detailsheadView()

@end

@implementation detailsheadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.namelab];
        [self addSubview:self.contentlab];
        [self addSubview:self.fromlab];
        [self addSubview:self.numberlab];
        [self addSubview:self.title];
        [self addSubview:self.timelab];
        [self addSubview:self.dianzanbtn];
        [self addSubview:self.combtn];
        [self addSubview:self.sharebtn];
        [self addSubview:self.thumview];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.namelab.frame = CGRectMake(14*WIDTH_SCALE, 16*HEIGHT_SCALE, 100*WIDTH_SCALE, 30*HEIGHT_SCALE);
    self.fromlab.frame = CGRectMake(DEVICE_WIDTH-200*WIDTH_SCALE, 18*WIDTH_SCALE, 185*WIDTH_SCALE, 26*HEIGHT_SCALE);
    self.numberlab.frame = CGRectMake(14*WIDTH_SCALE, self.frame.size.height-18*HEIGHT_SCALE-14*HEIGHT_SCALE, 100*WIDTH_SCALE, 14*HEIGHT_SCALE);
    
    [self.contentlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.namelab).with.offset(14*HEIGHT_SCALE+30*HEIGHT_SCALE);
        make.left.equalTo(self).with.offset(14*WIDTH_SCALE);
        make.right.equalTo(self).with.offset(-14*WIDTH_SCALE);
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentlab).with.offset(14*WIDTH_SCALE+self.contentlab.frame.size.height*HEIGHT_SCALE);
        CGFloat hei = 15*WIDTH_SCALE;
        make.height.mas_equalTo(hei);
        make.left.equalTo(self).with.offset(14*WIDTH_SCALE);
        make.right.equalTo(self).with.offset(-14*WIDTH_SCALE);
    }];
    
    [self.timelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(14*WIDTH_SCALE);
        make.width.mas_offset(@100);
        make.top.equalTo(self.title).with.offset(15*HEIGHT_SCALE+24*HEIGHT_SCALE);
        CGFloat hei = 15*WIDTH_SCALE;
        make.height.mas_equalTo(hei);
        
    }];
    
    [self.sharebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-14*WIDTH_SCALE);
        make.top.equalTo(self.title).with.offset(15*HEIGHT_SCALE+20*HEIGHT_SCALE);
        
    }];
    [self.combtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-14*WIDTH_SCALE-50*WIDTH_SCALE);
        make.top.equalTo(self.title).with.offset(15*HEIGHT_SCALE+20*HEIGHT_SCALE);
    }];
    [self.dianzanbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-14*WIDTH_SCALE-110*WIDTH_SCALE);
        make.top.equalTo(self.title).with.offset(15*HEIGHT_SCALE+20*HEIGHT_SCALE);
    }];
    
    [self.thumview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(14*WIDTH_SCALE);
        make.right.equalTo(self).with.offset(-14*WIDTH_SCALE);
        make.top.equalTo(self.timelab).with.offset(33*HEIGHT_SCALE);
    }];
    
    
}

#pragma mark - getters

-(UILabel *)namelab
{
    if(!_namelab)
    {
        _namelab = [[UILabel alloc] init];
        _namelab.textColor = [UIColor wjColorFloat:@"C7C7CD"];
        _namelab.font = [UIFont systemFontOfSize:14*FX];
        _namelab.text = @"评论名字";
    }
    return _namelab;
}

-(UILabel *)fromlab
{
    if(!_fromlab)
    {
        _fromlab = [[UILabel alloc] init];
        _fromlab.textColor = [UIColor wjColorFloat:@"C7C7CD"];
        _fromlab.font = [UIFont systemFontOfSize:12*FX];
        _fromlab.text = @"来自网易老司机的评论";
        _fromlab.textAlignment = NSTextAlignmentRight;
    }
    return _fromlab;
}

-(UILabel *)contentlab
{
    if(!_contentlab)
    {
        _contentlab = [[UILabel alloc] init];
        _contentlab.textColor = [UIColor wjColorFloat:@"333333"];
        _contentlab.text = @"赵客缦胡缨，吴钩霜雪明。银鞍照白马，飒沓如流星。十步杀一人，千里不留行。事了拂衣去，深藏身与名。闲过信陵饮，脱剑膝前横。将炙啖朱亥，持觞劝侯嬴。三杯吐然诺，五岳倒为轻。眼花耳热后，意气素霓生。救赵挥金槌，邯郸先震惊。千秋二壮士，烜赫大梁城。纵死侠骨香，不惭世上英。谁能书阁下，白首太玄经。";
        CGSize textSize = [_contentlab setText:_contentlab.text lines:QSTextDefaultLines andLineSpacing:QSTextLineSpacing constrainedToSize:CGSizeMake(DEVICE_WIDTH - 30,MAXFLOAT)];
        self.contentlab.frame = CGRectMake(14*WIDTH_SCALE,  30*HEIGHT_SCALE, textSize.width, textSize.height);
        height1 = textSize.height;
        
    }
    return _contentlab;
}

-(UILabel *)numberlab
{
    if(!_numberlab)
    {
        _numberlab = [[UILabel alloc] init];
        _numberlab.textColor = [UIColor wjColorFloat:@"C7C7CD"];
        _numberlab.font = [UIFont systemFontOfSize:14*FX];
        _numberlab.text = @"2人评论";
    }
    return _numberlab;
}

-(titleView *)title
{
    if(!_title)
    {
        _title = [[titleView alloc] init];
        
    }
    return _title;
}


-(UILabel *)timelab
{
    if(!_timelab)
    {
        _timelab = [[UILabel alloc] init];
        _timelab.text = @"三分钟前";
        _timelab.textColor = [UIColor wjColorFloat:@"C7C7CD"];
        _timelab.font = [UIFont systemFontOfSize:13*FX];
    }
    return _timelab;
}

-(zanBtn *)dianzanbtn
{
    if(!_dianzanbtn)
    {
        _dianzanbtn = [[zanBtn alloc] init];
        
    }
    return _dianzanbtn;
}


-(commentsBtn *)combtn
{
    if(!_combtn)
    {
        _combtn = [[commentsBtn alloc] init];
        
    }
    return _combtn;
}

-(UIButton *)sharebtn
{
    if(!_sharebtn)
    {
        _sharebtn = [[UIButton alloc] init];
        [_sharebtn setImage:[UIImage imageNamed:@"分享"] forState:normal];
    }
    return _sharebtn;
}

-(thumbView *)thumview
{
    if(!_thumview)
    {
        _thumview = [[thumbView alloc] init];
        
    }
    return _thumview;
}



@end
