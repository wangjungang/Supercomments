//
//  newCell.m
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/7.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "newCell.h"
#import "UILabel+MultipleLines.h"
@interface newCell()
@property (nonatomic,strong) UIImageView *reimg;

@end

@implementation newCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.namelab];
        [self.contentView addSubview:self.fromlab];
        [self.contentView addSubview:self.contentlab];
        [self.contentView addSubview:self.titlelab];
        [self.contentView addSubview:self.zanbtn];
        [self.contentView addSubview:self.setbtn];
        [self.contentView addSubview:self.reimg];
        [self.contentView addSubview:self.timelab];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.namelab.frame = CGRectMake(15*WIDTH_SCALE, 8*HEIGHT_SCALE, 120*WIDTH_SCALE, 15*HEIGHT_SCALE);
    self.fromlab.frame = CGRectMake(DEVICE_WIDTH-200*WIDTH_SCALE, 10*HEIGHT_SCALE, 185*WIDTH_SCALE, 14*HEIGHT_SCALE);
    self.reimg.frame = CGRectMake(15*WIDTH_SCALE, self.frame.size.height-30*HEIGHT_SCALE, 24*WIDTH_SCALE, 18*HEIGHT_SCALE);
    self.timelab.frame = CGRectMake(15*WIDTH_SCALE+30*WIDTH_SCALE, self.frame.size.height-30*HEIGHT_SCALE, 50*WIDTH_SCALE, 18*HEIGHT_SCALE);
    
}

#pragma mark - getters

-(UILabel *)namelab
{
    if(!_namelab)
    {
        _namelab = [[UILabel alloc] init];
        _namelab.textColor = [UIColor wjColorFloat:@"C7C7CD"];
        _namelab.font = [UIFont systemFontOfSize:14];
        _namelab.text = @"姓名";
        
    }
    return _namelab;
}

-(UILabel *)fromlab
{
    if(!_fromlab)
    {
        _fromlab = [[UILabel alloc] init];
        _fromlab.textColor = [UIColor wjColorFloat:@"C7C7CD"];
        _fromlab.font = [UIFont systemFontOfSize:12];
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
        _contentlab.font = [UIFont systemFontOfSize:14];
        _contentlab.textColor = [UIColor wjColorFloat:@"333333"];
    }
    return _contentlab;
}

-(UILabel *)timelab
{
    if(!_timelab)
    {
        _timelab = [[UILabel alloc] init];
        _timelab.text = @"十分钟前";
        _timelab.textColor = [UIColor wjColorFloat:@"C7C7CD"];
        _timelab.font = [UIFont systemFontOfSize:12];
        
    }
    return _timelab;
}

-(UIImageView *)reimg
{
    if(!_reimg)
    {
        _reimg = [[UIImageView alloc] init];
        _reimg.image = [UIImage imageNamed:@"牛评"];
    }
    return _reimg;
}




- (void)layoutSubviewsWithText:(NSString *)text{
    CGSize textSize = [self.contentlab setText:text lines:QSTextDefaultLines andLineSpacing:QSTextLineSpacing constrainedToSize:CGSizeMake(DEVICE_WIDTH - 30,MAXFLOAT)];
    self.contentlab.frame = CGRectMake(15,  30*HEIGHT_SCALE, textSize.width, textSize.height);
    
}

+ (CGFloat)cellHeightWithText:(NSString *)text{
    
    CGSize textSize = [UILabel sizeWithText:text
                                      lines:QSTextDefaultLines
                                       font:[UIFont systemFontOfSize:QSTextFontSize]
                             andLineSpacing:QSTextLineSpacing
                          constrainedToSize:CGSizeMake(DEVICE_WIDTH - 30,MAXFLOAT)];
    
    return textSize.height + 141;
}



@end
