//
//  replyCell.m
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/6.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "replyCell.h"

@implementation replyCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.picimage];
        [self.contentView addSubview:self.namelab];
        [self.contentView addSubview:self.rightimage];
        [self.contentView addSubview:self.textlab];
        [self.contentView addSubview:self.timelab];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.picimage.frame = CGRectMake(14*WIDTH_SCALE, 16*HEIGHT_SCALE, 36*WIDTH_SCALE, 36*WIDTH_SCALE);
    self.namelab.frame = CGRectMake(28*WIDTH_SCALE+36*WIDTH_SCALE, 20*HEIGHT_SCALE, 100*WIDTH_SCALE, 10*HEIGHT_SCALE);
    self.rightimage.frame = CGRectMake(DEVICE_WIDTH-14*WIDTH_SCALE-50*WIDTH_SCALE, 16*HEIGHT_SCALE, 50*WIDTH_SCALE, 50*WIDTH_SCALE);
    self.textlab.frame = CGRectMake(128/2*WIDTH_SCALE, 94/2*WIDTH_SCALE, DEVICE_WIDTH-128/2*WIDTH_SCALE-148/2*WIDTH_SCALE, (248/2-94/2-44)*HEIGHT_SCALE);
}

#pragma mark - getters

-(UIImageView *)picimage
{
    if(!_picimage)
    {
        _picimage = [[UIImageView alloc] init];
        _picimage.layer.masksToBounds =YES;
        _picimage.layer.cornerRadius = 18*WIDTH_SCALE;
        _picimage.backgroundColor = [UIColor greenColor];
    }
    return _picimage;
}

-(UILabel *)namelab
{
    if(!_namelab)
    {
        _namelab = [[UILabel alloc] init];
        _namelab.text = @"大米饭饭";
        _namelab.textColor = [UIColor wjColorFloat:@"455F8E"];
    }
    return _namelab;
}


-(UIImageView *)rightimage
{
    if(!_rightimage)
    {
        _rightimage = [[UIImageView alloc]init];
        _rightimage.backgroundColor = [UIColor orangeColor];
    }
    return _rightimage;
}

-(UILabel *)textlab
{
    if(!_textlab)
    {
        _textlab = [[UILabel alloc] init];
        NSString *str = @"无尽火域，炎帝执掌，无尽火域，炎帝执掌，无尽火域，炎帝执掌，无尽火域，炎帝执掌，无尽火域，炎帝执掌，";
        _textlab.backgroundColor = [UIColor redColor];
        _textlab.font = [UIFont systemFontOfSize:15];
        _textlab.numberOfLines = 0;//多行显示，计算高度
        _textlab.text = str;
        
    }
    return _textlab;
}

-(UILabel *)timelab
{
    if(!_timelab)
    {
        _timelab = [[UILabel alloc] init];
        
    }
    return _timelab;
}




@end
