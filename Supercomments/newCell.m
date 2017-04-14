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
//        [self.contentView addSubview:self.setbtn];
        [self.contentView addSubview:self.reimg];
        [self.contentView addSubview:self.commbtn];
        [self.contentView addSubview:self.zbtn];
        [self.contentView addSubview:self.timelab];
        
        [self.contentView addSubview:self.infoimg];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.namelab.frame = CGRectMake(14*WIDTH_SCALE, 8*HEIGHT_SCALE, 120*WIDTH_SCALE, 15*HEIGHT_SCALE);
    self.fromlab.frame = CGRectMake(DEVICE_WIDTH-200*WIDTH_SCALE, 10*HEIGHT_SCALE, 185*WIDTH_SCALE, 14*HEIGHT_SCALE);
    self.reimg.frame = CGRectMake(14*WIDTH_SCALE, self.frame.size.height-30*HEIGHT_SCALE, 24*WIDTH_SCALE, 18*HEIGHT_SCALE);
    self.timelab.frame = CGRectMake(14*WIDTH_SCALE+30*WIDTH_SCALE, self.frame.size.height-30*HEIGHT_SCALE, 50*WIDTH_SCALE, 18*HEIGHT_SCALE);
    self.commbtn.frame = CGRectMake(DEVICE_WIDTH-50*WIDTH_SCALE, self.frame.size.height-30*HEIGHT_SCALE, 40*WIDTH_SCALE, 22*HEIGHT_SCALE);
    self.zbtn.frame = CGRectMake(DEVICE_WIDTH-110*WIDTH_SCALE, self.frame.size.height-30*HEIGHT_SCALE, 40*WIDTH_SCALE, 20*HEIGHT_SCALE);
    self.titlelab.frame = CGRectMake(14*WIDTH_SCALE, self.frame.size.height-65*HEIGHT_SCALE, DEVICE_WIDTH-28*WIDTH_SCALE, 30*HEIGHT_SCALE);
    
    
    [[SDWebImageDownloader sharedDownloader]downloadImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491562601265&di=51fbf1320a65a3c5c78945548d3f4543&imgtype=0&src=http%3A%2F%2Fimgcache.mysodao.com%2Fimg1%2FM05%2FAE%2F09%2FCgAPDE9HBDTVnPg5AAhpyG48ies967-dd7e1653.JPG"] options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        //这边就能拿到图片了
        
        CGFloat width = image.size.width;
        NSLog(@"width======%f",width);
        CGRect rect = CGRectMake(14*WIDTH_SCALE, self.frame.size.height-270*HEIGHT_SCALE, width, 200*HEIGHT_SCALE);//创建矩形框
        _infoimg.image = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([image CGImage] ,rect)];
        
        self.infoimg.image = image;
        self.infoimg.frame =CGRectMake(14*WIDTH_SCALE, self.frame.size.height-270*HEIGHT_SCALE, DEVICE_WIDTH-28*WIDTH_SCALE, 200*HEIGHT_SCALE);
        
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
        _fromlab.font = [UIFont systemFontOfSize:12*FX];
        _fromlab.text = @"来自网易老司机的评论";
        _fromlab.textAlignment = NSTextAlignmentRight;
    }
    return _fromlab;
}

#pragma 行间距 4

-(UILabel *)contentlab
{
    if(!_contentlab)
    {
        _contentlab = [[UILabel alloc] init];
        _contentlab.font = [UIFont systemFontOfSize:16*FX];
        
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
        _timelab.font = [UIFont systemFontOfSize:12*FX];
        
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

-(commentsBtn *)commbtn
{
    if(!_commbtn)
    {
        _commbtn = [[commentsBtn alloc] init];
        [_commbtn addTarget:self action:@selector(test2:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commbtn;
}


-(zanBtn *)zbtn
{
    if(!_zbtn)
    {
        _zbtn = [[zanBtn alloc] init];
        [_zbtn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _zbtn;
}


-(titleView *)titlelab
{
    if(!_titlelab)
    {
        _titlelab = [[titleView alloc] init];
        
    }
    return _titlelab;
}


-(UIImageView *)infoimg
{
    if(!_infoimg)
    {
        _infoimg = [[UIImageView alloc] init];
        
    }
    return _infoimg;
}


- (void)layoutSubviewsWithText:(NSString *)text{
    CGSize textSize = [self.contentlab setText:text lines:QSTextDefaultLines2 andLineSpacing:QSTextLineSpacing constrainedToSize:CGSizeMake(DEVICE_WIDTH - 30,MAXFLOAT)];
    self.contentlab.frame = CGRectMake(14*WIDTH_SCALE,  30*HEIGHT_SCALE, textSize.width, textSize.height);
    
}

+ (CGFloat)cellHeightWithText:(NSString *)text{
    
    CGSize textSize = [UILabel sizeWithText:text
                                      lines:QSTextDefaultLines2
                                       font:[UIFont systemFontOfSize:QSTextFontSize2]
                             andLineSpacing:QSTextLineSpacing
                          constrainedToSize:CGSizeMake(DEVICE_WIDTH - 30,MAXFLOAT)];
    
    return textSize.height + 320*HEIGHT_SCALE;
}

//按钮事件

//点赞
-(void)test:(UIButton *)sender
{
    [self.delegate myTabVClick1:self];
}

//回复
-(void)test2:(UIButton *)sender
{

    [self.delegate myTabVClick2:self];
}

@end
