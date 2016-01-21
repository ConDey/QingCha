//
//  ElectedViewCell.m
//  QingCha
//
//  Created by eazytec on 16/1/19.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "ElectionViewCell.h"

#define ELECTION_IMAGE_WIDTH    SCREEN_WIDTH
#define ELECTION_IMAGE_HEIGHT   SCREEN_WIDTH * 2/3

#define TITLE_LABEL_INDEX_X   12.0
#define TITLE_LABEL_INDEX_Y   15.0 + ELECTION_IMAGE_HEIGHT
#define TITLE_LABEL_WIDTH     SCREEN_WIDTH - TITLE_LABEL_INDEX_X * 2
#define TITLE_LABEL_FONT_SIZE 14

#define INTRODUCTION_LABEL_INDEX_X   TITLE_LABEL_INDEX_X
#define INTRODUCTION_LABEL_INDEX_Y   14.0 + TITLE_LABEL_INDEX_Y + TITLE_LABEL_FONT_SIZE
#define INTRODUCTION_LABEL_WIDTH     TITLE_LABEL_WIDTH
#define INTRODUCTION_LABEL_FONT_SIZE 13

#define NUM_LABEL_INDEX_X   SCREEN_WIDTH - TITLE_LABEL_INDEX_X - NUM_LABEL_WIDTH
#define NUM_LABEL_INDEX_Y   10.0 + INTRODUCTION_LABEL_INDEX_Y + INTRODUCTION_LABEL_FONT_SIZE
#define NUM_LABEL_WIDTH     200
#define NUM_LABEL_FONT_SIZE 12

#define TAG_LABEL_INDEX_X TITLE_LABEL_INDEX_X;
#define TAG_LABEL_INDEX_Y 10.0 + INTRODUCTION_LABEL_INDEX_Y + INTRODUCTION_LABEL_FONT_SIZE
#define TAG_LABEL_WIDTH_EQUALIZE  15.0
#define TAG_LABEL_INDEX_X_EQUALIZE 6.0  // X轴的偏移量补偿
#define TAG_LAEBL_HEIGHT 18
#define TAG_LABEL_FONT_SIZE 12


#define ELECTED_CELL_HEIGHT NUM_LABEL_INDEX_Y + NUM_LABEL_FONT_SIZE + 10.0

@interface ElectionViewCell ()

@property (nonatomic,retain) UIImageView *electionImageView;
@property (nonatomic,retain) UILabel *titleLabel;
@property (nonatomic,retain) UILabel *introductionLabel;

@property (nonatomic,retain) UILabel *numLabel;

@end

@implementation ElectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        self.selectionStyle = UITableViewCellStyleDefault;
        
        [self.contentView addSubview:self.electionImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.introductionLabel];
        [self.contentView addSubview:self.numLabel];    
    }
    return self;
}


- (UIImageView *)electionImageView {
    if (_electionImageView == nil) {
        _electionImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ELECTION_IMAGE_WIDTH, ELECTION_IMAGE_HEIGHT)];
        _electionImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _electionImageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(TITLE_LABEL_INDEX_X, TITLE_LABEL_INDEX_Y, TITLE_LABEL_WIDTH, TITLE_LABEL_FONT_SIZE)];
        _titleLabel.font = [UIFont systemFontOfSize:TITLE_LABEL_FONT_SIZE];
        _titleLabel.textColor = UI_TITLE_COLOR;
        _titleLabel.numberOfLines = 1;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLabel;
}

- (UILabel *)introductionLabel {
    if (_introductionLabel == nil) {
        _introductionLabel = [[UILabel alloc]initWithFrame:CGRectMake(INTRODUCTION_LABEL_INDEX_X, INTRODUCTION_LABEL_INDEX_Y, INTRODUCTION_LABEL_WIDTH, INTRODUCTION_LABEL_FONT_SIZE)];
        _introductionLabel.font = [UIFont systemFontOfSize:INTRODUCTION_LABEL_FONT_SIZE];
        _introductionLabel.textColor = UI_INTRODUCTION_COLOR;
        _introductionLabel.numberOfLines = 1;
        _introductionLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _introductionLabel;
}

- (UILabel *)numLabel {
    if (_numLabel == nil) {
        _numLabel = [[UILabel alloc]initWithFrame:CGRectMake(INTRODUCTION_LABEL_INDEX_X, INTRODUCTION_LABEL_INDEX_Y, INTRODUCTION_LABEL_WIDTH, NUM_LABEL_FONT_SIZE)];
        _numLabel.font = [UIFont systemFontOfSize:NUM_LABEL_FONT_SIZE];
        _numLabel.textColor = UI_GREP_COLOR;
        _numLabel.textAlignment = NSTextAlignmentRight;
    }
    return _numLabel;
}


// ---------- 导入数据模型 ---------------------

- (void)importDataForElection:(QCElection *)election {
    if (election == nil) {
        return;
    }
    [self.electionImageView setImage:election.electionImage]; // 导入推荐图片
    [self.titleLabel setText:election.title];
    [self.introductionLabel setText:election.introduction];
    [self.numLabel setText:[NSString stringByAppendingHead:election.visitnum foot:@"人喜欢"]];
    
    // tag在x轴的位置,计算偏移量
    CGFloat tagIndex = TAG_LABEL_INDEX_X;
    // 设置标签
    NSArray *tags = [election tagsDisplay];
    for (int index = 0; index < tags.count; index++) {
        NSString *text = [tags objectAtIndex:index];
        
        UILabel *tagLabel = [UILabel tagLabel];
        tagLabel.text = text;
        // 计算tagLabel的位置, 根据文字的大小计算长度
        NSDictionary *textSizeAttirbute = @{NSFontAttributeName: [UIFont systemFontOfSize:TAG_LABEL_FONT_SIZE]};
        tagLabel.frame = CGRectMake(tagIndex, TAG_LABEL_INDEX_Y, [NSString widthString:text font:textSizeAttirbute] + TAG_LABEL_WIDTH_EQUALIZE, TAG_LAEBL_HEIGHT);
        [self.contentView addSubview:tagLabel];
        
        // 重新计算下一个tag在x轴的位置
        tagIndex = tagIndex + tagLabel.frame.size.width + TAG_LABEL_INDEX_X_EQUALIZE;
    }
}

// ---------- 导入数据模型 ---------------------

+ (CGFloat)height {
    return ELECTED_CELL_HEIGHT;
}

@end
