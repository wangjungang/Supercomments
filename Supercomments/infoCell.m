//
//  infoCell.m
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/5.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "infoCell.h"

@implementation infoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.leftimg];
        [self.contentView addSubview:self.textlab];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.leftimg.frame = CGRectMake(20*WIDTH_SCALE, 10*HEIGHT_SCALE, 30*WIDTH_SCALE, 30*WIDTH_SCALE);
    self.textlab.frame = CGRectMake(60*WIDTH_SCALE, 10*HEIGHT_SCALE, 100*WIDTH_SCALE, 30*HEIGHT_SCALE);
    
}

#pragma mark - getters


-(UIImageView *)leftimg
{
    if(!_leftimg)
    {
        _leftimg = [[UIImageView alloc] init];
        
    }
    return _leftimg;
}

-(UILabel *)textlab
{
    if(!_textlab)
    {
        _textlab = [[UILabel alloc] init];
        
    }
    return _textlab;
}

@end
