//
//  detaolsCell.m
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/8.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "detaolsCell.h"

@implementation detaolsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.picimg];
        [self.contentView addSubview:self.namelab];
        [self.contentView addSubview:self.timelab];
        [self.contentView addSubview:self.contentlab];
        [self.contentView addSubview:self.pinglunlab];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.picimg.frame = CGRectMake(14*WIDTH_SCALE, 14*HEIGHT_SCALE, 32*WIDTH_SCALE, 32*WIDTH_SCALE);
    self.namelab.frame = CGRectMake(14*WIDTH_SCALE+32*WIDTH_SCALE+14*WIDTH_SCALE, 14*HEIGHT_SCALE, 80*WIDTH_SCALE, 14*HEIGHT_SCALE);
    self.timelab.frame = CGRectMake(14*WIDTH_SCALE+32*WIDTH_SCALE+14*WIDTH_SCALE, 14*HEIGHT_SCALE+20*HEIGHT_SCALE, 80*WIDTH_SCALE, 11*HEIGHT_SCALE);
    
}


#pragma mark - getters


-(UIImageView *)picimg
{
    if(!_picimg)
    {
        _picimg = [[UIImageView alloc] init];
        _picimg.backgroundColor = [UIColor orangeColor];
        _picimg.layer.masksToBounds = YES;
        _picimg.layer.cornerRadius = 16*WIDTH_SCALE;
    }
    return _picimg;
}

-(UILabel *)namelab
{
    if(!_namelab)
    {
        _namelab = [[UILabel alloc] init];
        _namelab.text = @"姓名姓名";
        _namelab.textColor = [UIColor wjColorFloat:@"CDCDC7"];
        _namelab.font = [UIFont systemFontOfSize:14*FX];
    }
    return _namelab;
}

-(UILabel *)timelab
{
    if(!_timelab)
    {
        _timelab = [[UILabel alloc] init];
        _timelab.text = @"12:00";
        _timelab.textColor = [UIColor wjColorFloat:@"CDCDC7"];
        _timelab.font = [UIFont systemFontOfSize:11*FX];
    }
    return _timelab;
}

-(UILabel *)contentlab
{
    if(!_contentlab)
    {
        _contentlab = [[UILabel alloc] init];
        _contentlab.numberOfLines = 0;
        _contentlab.textColor = [UIColor wjColorFloat:@"333333"];
        _contentlab.font = [UIFont systemFontOfSize:16*FX];
        _contentlab.text = @"赵客缦胡缨，吴钩霜雪明。银鞍照白马，飒沓如流星。十步杀一人，千里不留行。事了拂衣去，深藏身与名。";
        CGSize textSize = [_contentlab setText:_contentlab.text lines:QSTextDefaultLines andLineSpacing:QSTextLineSpacing constrainedToSize:CGSizeMake(DEVICE_WIDTH - 94*WIDTH_SCALE-14*WIDTH_SCALE,MAXFLOAT)];
        self.contentlab.frame = CGRectMake(14*WIDTH_SCALE+32*WIDTH_SCALE+14*WIDTH_SCALE,  60*HEIGHT_SCALE, textSize.width, textSize.height);
        _hei = textSize.height;
    }
    return _contentlab;
}

-(UILabel *)pinglunlab
{
    if(!_pinglunlab)
    {
        _pinglunlab = [[UILabel alloc] init];
        _pinglunlab.numberOfLines = 0;
        _pinglunlab.font = [UIFont systemFontOfSize:14*FX];
        
    }
    return _pinglunlab;
}





@end
