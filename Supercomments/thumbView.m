//
//  thumbView.m
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/10.
//  Copyright © 2017年 wangjungang. All rights reserved.
//
#define CREATE_BUTTON(X,Y,WIDTH,TITLE) [self addButtonWithX:X y:Y width:WIDTH title:TITLE]
#define UPDATEFRAME [self updateAviewFrame];
#import "thumbView.h"

@implementation thumbView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        //[self addSubview:self.leftimg];
        [self richTextLable];
    }

    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.leftimg.frame = CGRectMake(0, 0, 14*WIDTH_SCALE, 14*WIDTH_SCALE);
    
}

#pragma mark - getters


-(UIImageView *)leftimg
{
    if(!_leftimg)
    {
        _leftimg = [[UIImageView alloc] init];
        _leftimg.image = [UIImage imageNamed:@"详情页点赞-提示"];
    }
    return _leftimg;
}

-(void)richTextLable
{
    
   

    
    NSArray *goodArray = @[@"张三",@"李四",@"王五",@"李兆",@"粟子",@"小李",@"李四",@"王五",@"李兆",@"粟子",@"小李"];
    
    NSString *goodTotalString = [goodArray componentsJoinedByString:@", "];
    
    NSMutableAttributedString *newGoodString = [[NSMutableAttributedString alloc] initWithString:goodTotalString];
    [newGoodString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, goodTotalString.length)];
    
    //设置行距 实际开发中间距为0太丑了，根据项目需求自己把握
    NSMutableParagraphStyle *paragraphstyle = [[NSMutableParagraphStyle alloc] init];
    paragraphstyle.lineSpacing = 3;
    [newGoodString addAttribute:NSParagraphStyleAttributeName value:paragraphstyle range:NSMakeRange(0, goodTotalString.length)];
    
    
    UILabel *goodTextLbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, DEVICE_WIDTH- 40, 20)];
    
    // 添加图片
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 图片
    attch.image = [UIImage imageNamed:@"详情页点赞-提示"];
    // 设置图片大小
    attch.bounds = CGRectMake(0, 0, 14, 14);
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    //[newGoodString appendAttributedString:string];
    
    [newGoodString insertAttributedString:string atIndex:0];
    
    goodTextLbl.backgroundColor = [UIColor orangeColor];
    goodTextLbl.numberOfLines = 0;//设置UILable自适应
    goodTextLbl.attributedText = newGoodString;
   
    
    [self addSubview:goodTextLbl];
    [goodTextLbl sizeToFit];
    
    
    [goodTextLbl onTapRangeActionWithString:goodArray tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        NSLog(@"这是第--%ld--个点赞的,他是--%@",index,string);
    }];
}



@end
