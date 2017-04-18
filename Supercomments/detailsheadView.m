//
//  detailsheadView.m
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/8.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "detailsheadView.h"
#import "headModel.h"
@interface detailsheadView()
@property (nonatomic,strong) headModel *hmodel;
@end

@implementation detailsheadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.namelab];
        [self addSubview:self.contentlab];
        [self addSubview:self.fromlab];
        [self addSubview:self.numberlab];
        [self addSubview:self.title];
        [self addSubview:self.timelab];
        [self addSubview:self.dianzanbtn];
        [self addSubview:self.combtn];
        [self addSubview:self.sharebtn];
        [self addSubview:self.thumlabel];
        [self addSubview:self.headimg];
        [self addSubview:self.thumlabel];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.namelab.frame = CGRectMake(14*WIDTH_SCALE, 16*HEIGHT_SCALE, 100*WIDTH_SCALE, 14*HEIGHT_SCALE);
    self.fromlab.frame = CGRectMake(DEVICE_WIDTH-200*WIDTH_SCALE, 18*WIDTH_SCALE, 185*WIDTH_SCALE, 12*HEIGHT_SCALE);
    self.numberlab.frame = CGRectMake(14*WIDTH_SCALE, self.frame.size.height-18*HEIGHT_SCALE-14*HEIGHT_SCALE, 100*WIDTH_SCALE, 14*HEIGHT_SCALE);
}

-(CGFloat)setheadmodel:(headModel*)model
{
    self.hmodel = model;
    self.contentlab.text = model.contactstr;
    self.namelab.text = model.namestr;
    self.fromlab.text = model.fromstr;
    
    
    NSArray *goodArray = model.thumarr;
    NSString *goodTotalString = [goodArray componentsJoinedByString:@", "];
    NSMutableAttributedString *newGoodString = [[NSMutableAttributedString alloc] initWithString:goodTotalString];
    [newGoodString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, goodTotalString.length)];
    //设置行距 实际开发中间距为0太丑了，根据项目需求自己把握
    NSMutableParagraphStyle *paragraphstyle = [[NSMutableParagraphStyle alloc] init];
    paragraphstyle.lineSpacing = 3;
    [newGoodString addAttribute:NSParagraphStyleAttributeName value:paragraphstyle range:NSMakeRange(0, goodTotalString.length)];
    // 添加图片
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 图片
    attch.image = [UIImage imageNamed:@"详情页点赞-提示"];
    // 设置图片大小
    attch.bounds = CGRectMake(0, 0, 14*WIDTH_SCALE, 14*WIDTH_SCALE);
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    [newGoodString insertAttributedString:string atIndex:0];
    self.thumlabel.attributedText = newGoodString;
    self.thumlabel.numberOfLines = 0;
    //设置UILable自适
    self.thumlabel.lineBreakMode = NSLineBreakByCharWrapping;
    [self.thumlabel sizeToFit];
  
    
//点击名字的方法，待修改，有bug
//    [self.thumlabel onTapRangeActionWithString:goodArray tapClicked:^(NSString *string, NSRange range, NSInteger index) {
//        NSLog(@"这是第--%ld--个点赞的,他是--%@",index,string);
//        
//    }];
    
    [[SDWebImageDownloader sharedDownloader]downloadImageWithURL:[NSURL URLWithString:model.imgurlstr] options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        //这边就能拿到图片了
        
        if (model.imgurlstr.length==0) {
            [self.headimg setHidden:YES];
            [self.contentlab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.namelab).with.offset(14*HEIGHT_SCALE+14*HEIGHT_SCALE);
                make.left.equalTo(self).with.offset(14*WIDTH_SCALE);
                make.right.equalTo(self).with.offset(-14*WIDTH_SCALE);
            }];
            self.title.frame = CGRectMake(14*WIDTH_SCALE, (14+16+self.contentlab.frame.size.height)*HEIGHT_SCALE, DEVICE_WIDTH-28*WIDTH_SCALE, 15*HEIGHT_SCALE);
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
            
            [self.thumlabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).with.offset(14*WIDTH_SCALE);
                make.right.equalTo(self).with.offset(-14*WIDTH_SCALE);
                make.top.equalTo(self.timelab).with.offset(33*HEIGHT_SCALE);
            }];
        }
        else if(model.imgurlstr.length!=0&&model.contactstr.length==0)
        {
            [self.headimg setHidden:NO];
            [self.contentlab setHidden:YES];
            
            self.headimg.frame = CGRectMake(14*WIDTH_SCALE,(14+16+self.namelab.frame.size.height+14)*HEIGHT_SCALE, DEVICE_WIDTH-28*WIDTH_SCALE, 200*HEIGHT_SCALE);
            self.title.frame = CGRectMake(14*WIDTH_SCALE, (14+16+self.namelab.frame.size.height+4+200+14)*HEIGHT_SCALE, DEVICE_WIDTH-28*WIDTH_SCALE, 15*HEIGHT_SCALE);
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
            [self.thumlabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).with.offset(14*WIDTH_SCALE);
                make.right.equalTo(self).with.offset(-14*WIDTH_SCALE);
                make.top.equalTo(self.timelab).with.offset(33*HEIGHT_SCALE);
            }];


        }
        else
        {
            [self.headimg setHidden:NO];
            [self.contentlab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.namelab).with.offset(14*HEIGHT_SCALE+14*HEIGHT_SCALE);
                make.left.equalTo(self).with.offset(14*WIDTH_SCALE);
                make.right.equalTo(self).with.offset(-14*WIDTH_SCALE);
            }];
            self.headimg.frame = CGRectMake(14*WIDTH_SCALE,(14+16+self.contentlab.frame.size.height)*HEIGHT_SCALE, DEVICE_WIDTH-28*WIDTH_SCALE, 200*HEIGHT_SCALE);
            self.title.frame = CGRectMake(14*WIDTH_SCALE, (14+16+self.contentlab.frame.size.height+4+200)*HEIGHT_SCALE, DEVICE_WIDTH-28*WIDTH_SCALE, 15*HEIGHT_SCALE);
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
            [self.thumlabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).with.offset(14*WIDTH_SCALE);
                make.right.equalTo(self).with.offset(-14*WIDTH_SCALE);
                make.top.equalTo(self.timelab).with.offset(33*HEIGHT_SCALE);
            }];
            
        }
    }];
    CGFloat heithum = self.thumlabel.frame.size.height;
    CGSize textSize = [_contentlab setText:_contentlab.text lines:QSTextDefaultLines andLineSpacing:QSTextLineSpacing constrainedToSize:CGSizeMake(DEVICE_WIDTH - 30,MAXFLOAT)];
    self.contentlab.frame = CGRectMake(14*WIDTH_SCALE,  30*HEIGHT_SCALE, textSize.width, textSize.height);
    height1 = textSize.height;
    return height1+heithum;
}

#pragma mark - getters

-(UILabel *)namelab
{
    if(!_namelab)
    {
        _namelab = [[UILabel alloc] init];
        _namelab.textColor = [UIColor wjColorFloat:@"C7C7CD"];
        _namelab.font = [UIFont systemFontOfSize:14*FX];
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
        _dianzanbtn =  [zanBtn buttonWithType:UIButtonTypeCustom];;
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


-(UILabel *)thumlabel
{
    if(!_thumlabel)
    {
        _thumlabel = [[UILabel alloc] init];
        _thumlabel.textColor = [UIColor wjColorFloat:@"C7C7CD"];
    }
    return _thumlabel;
}




-(UIImageView *)headimg
{
    if(!_headimg)
    {
        _headimg = [[UIImageView alloc] init];
        _headimg.backgroundColor = [UIColor greenColor];
    }
    return _headimg;
}



@end
