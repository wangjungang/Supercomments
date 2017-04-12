//
//  SQCommentTableViewCell.m
//  CommentDemo
//
//  Created by suqianghotel on 16/8/21.
//  Copyright © 2016年 suqianghotel. All rights reserved.
//

#import "SQCommentTableViewCell.h"
#import "SQCommentModel.h"
#import "SQCommentCellViewModel.h"
#import "TTTAttributedLabel.h"


@interface SQCommentTableViewCell()
@property(nonatomic, strong) TTTAttributedLabel *contentLabel;
@end

@implementation SQCommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {

        _contentLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = [UIColor wjColorFloat:@"333333"];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.linkAttributes = @{NSForegroundColorAttributeName: [UIColor wjColorFloat:@"CDCDC7"]};
        _contentLabel.activeLinkAttributes = @{NSForegroundColorAttributeName:[UIColor wjColorFloat:@"CDCDC7"]};
        
        [self.contentView addSubview:_contentLabel];
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    if (highlighted == YES) {
        self.contentView.backgroundColor = [UIColor lightGrayColor];
    }
    else
    {
        self.contentView.backgroundColor = [UIColor clearColor];
    }
}


- (void)setCommentCellVM:(SQCommentCellViewModel *)commentCellVM
{
    _commentCellVM = commentCellVM;
    
    self.contentLabel.frame = commentCellVM.contentLabelF;
    self.contentLabel.text = commentCellVM.contentAttributedString;
    
    

    
    
    TTTAttributedLabelLink *fromLink = [self.contentLabel addLinkToPhoneNumber:commentCellVM.commentModel.from withRange:NSMakeRange(0, commentCellVM.commentModel.from.length)];
    
    fromLink.linkTapBlock = ^(TTTAttributedLabel *label, TTTAttributedLabelLink *link)
    {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(cell:didUserInfoClicked:)]) {
            [self.delegate cell:self didUserInfoClicked:commentCellVM.commentModel.from];
        }

    };
    
    if (commentCellVM.commentModel.to.length > 0) {
        TTTAttributedLabelLink *toLink = [self.contentLabel addLinkToPhoneNumber:commentCellVM.commentModel.from
                                                                       withRange:NSMakeRange(commentCellVM.commentModel.from.length + 2, commentCellVM.commentModel.to.length)];
        
        toLink.linkTapBlock = ^(TTTAttributedLabel *label, TTTAttributedLabelLink *link)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(cell:didUserInfoClicked:)]) {
                [self.delegate cell:self didUserInfoClicked:commentCellVM.commentModel.to];
            }
        };
    }
   
    //回复
//    TTTAttributedLabelLink *textlink = [self.contentLabel addLinkToPhoneNumber:commentCellVM.commentModel.content withRange:NSMakeRange(commentCellVM.commentModel.to.length+commentCellVM.commentModel.from.length, commentCellVM.commentModel.content.length)];
//    
//    textlink.linkTapBlock = ^(TTTAttributedLabel *label, TTTAttributedLabelLink *link)
//    {
//        if (self.delegate && [self.delegate respondsToSelector:@selector(cell:didUserInfoClicked:)]) {
//            [self.delegate cell:self didreply:commentCellVM.commentModel.content];
//        }
//    };
    
    
//    commentCellVM.commentModel.all;
}



@end
