//
//  DetailImageTableViewCell.m
//  QingCha
//
//  Created by eazytec on 15/12/11.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "DetailImageTableViewCell.h"

#import "UIConstranits.h"


@interface DetailImageTableViewCell ()

@property (nonatomic,retain) UIPageControl *pagecontrol;

@end

@implementation DetailImageTableViewCell

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
        
        CGFloat heightOfCell = SCREEN_WIDTH * 4/5;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 左右滑动的页面
        UIScrollView *imageviews = [[UIScrollView alloc]init];
        imageviews.frame = CGRectMake(0, 0, SCREEN_WIDTH, heightOfCell);
        imageviews.delegate = self;
        
        
        [imageviews setContentSize: CGSizeMake(SCREEN_WIDTH * 2, heightOfCell)];
        [imageviews setBounces:NO];
        [imageviews setShowsHorizontalScrollIndicator:NO];
        [imageviews setPagingEnabled:YES];
        
        for (int index = 0; index < 2; index++) {
            
            UIImageView *imageview = [[UIImageView alloc]init];
            if (index == 0) {
                imageview.image = [UIImage imageNamed:@"Products_Image2"];
                
            } else {
                imageview.image = [UIImage imageNamed:@"Products_Image3"];
            }
            imageview.frame = CGRectMake(SCREEN_WIDTH * index , 0, SCREEN_WIDTH, heightOfCell);
            imageview.contentMode = UIViewContentModeScaleToFill;
            [imageviews addSubview:imageview];
        }
        
        [self.contentView addSubview:imageviews];
        
        // PageControl
        _pagecontrol = [[UIPageControl alloc]init];
        _pagecontrol.center = CGPointMake(self.contentView.frame.size.width * 0.5, heightOfCell - 20);
        _pagecontrol.bounds = CGRectMake(0, 0, 200, 20);
        _pagecontrol.numberOfPages = 2;
        _pagecontrol.currentPage = 0;
        
        _pagecontrol.currentPageIndicatorTintColor = [UIColor blackColor];
        _pagecontrol.pageIndicatorTintColor = [UIColor grayColor];
        
        [self.contentView addSubview:_pagecontrol];
    }
    return self;
}


#pragma mark - scroll view setting

- (void)scrollViewDidEndDecelerating:(UIScrollView *)imageviews {
    [_pagecontrol setCurrentPage:fabs(imageviews.contentOffset.x) / SCREEN_WIDTH];
}

@end