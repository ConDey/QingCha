//
//  EvaluateTextTableViewCell.m
//  QingCha
//
//  Created by eazytec on 15/12/17.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "EvaluateTextTableViewCell.h"

#import "UIConstranits.h"

@interface EvaluateTextTableViewCell ()

@property (nonatomic,retain) UITextView *textview;

@end

@implementation EvaluateTextTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _textview = [[UITextView alloc]initWithFrame:CGRectMake(10, 20, SCREEN_WIDTH - 20, 130)];
        _textview.layer.masksToBounds = YES;
        _textview.layer.cornerRadius = 8;
        _textview.layer.borderWidth = 0.0f;
        _textview.layer.borderColor = [[UIColor whiteColor] CGColor];
        _textview.scrollEnabled = YES; //是否可以拖动
        
        //实现placehold
        _textview.text = @"请输入评价...";
        _textview.textColor = [UIColor grayColor];
        _textview.delegate = self;
        
        [self addSubview: _textview];
    }
    return  self;
}


- (void)textViewDidBeginEditing: (UITextView *) textView{
    if([_textview.text isEqualToString:@"请输入评价..."]){
        _textview.text = @"";
        _textview.textColor = [UIColor blackColor];
    }
}

- (void)textViewDidEndEditing: (UITextView *) textView{
    if(_textview.text.length < 1){
        _textview.text = @"请输入评价...";
        _textview.textColor = [UIColor grayColor];
    }
}

@end
