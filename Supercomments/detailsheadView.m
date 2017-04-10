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
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.namelab.frame = CGRectMake(15*WIDTH_SCALE, 16*HEIGHT_SCALE, 100*WIDTH_SCALE, 30*HEIGHT_SCALE);
    self.fromlab.frame = CGRectMake(DEVICE_WIDTH-200*WIDTH_SCALE, 18*WIDTH_SCALE, 185*WIDTH_SCALE, 26*HEIGHT_SCALE);
    
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
        
    }
    return _numberlab;
}




@end
