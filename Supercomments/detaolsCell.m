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
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
}

#pragma mark - getters

-(UIImageView *)picimg
{
    if(!_picimg)
    {
        _picimg = [[UIImageView alloc] init];
        
    }
    return _picimg;
}

-(UILabel *)namelab
{
    if(!_namelab)
    {
        _namelab = [[UILabel alloc] init];
        
    }
    return _namelab;
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
