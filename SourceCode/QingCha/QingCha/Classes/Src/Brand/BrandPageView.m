//
//  BrandPageView.m
//  QingCha
//
//  Created by eazytec on 16/1/25.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "BrandPageView.h"

#define VIEW_CELL_TOP_Y   40      // Cell与selfView的顶点间距
#define VIEW_CELL_BOTTOM  10      // Cell与selfView的顶点间距
#define VIEW_CELL_PADDING 2       // ViewCell之间的间距

#define CELL_LENGHT               self.frame.size.height - VIEW_CELL_TOP_Y - VIEW_CELL_BOTTOM

#define CELL_TITLE_WIDTH          200
#define CELL_TITLE_LENGHT         23
#define CELL_TITLE_INDEX_X        cellWidth - CELL_TITLE_WIDTH - 20
#define CELL_TITLE_INDEX_Y        30

#define CELL_IMAGE_INDEX_X_RIGHT  20
#define CELL_IMAGE_INDEX_X_LEFT   50
#define CELL_IMAGE_INDEX_Y        CELL_TITLE_INDEX_Y + CELL_TITLE_LENGHT + 15
#define CELL_IMAGE_WIDTH          cellWidth - CELL_IMAGE_INDEX_X_RIGHT - CELL_IMAGE_INDEX_X_LEFT
#define CELL_IMAGE_HEIGHT         (cellWidth - CELL_IMAGE_INDEX_X_RIGHT - CELL_IMAGE_INDEX_X_LEFT) * 1.3

#define CELL_TRANSVERSE_WIDTH     CELL_IMAGE_WIDTH - 10
#define CELL_TRANSVERSE_HEIGHT    1.1
#define CELL_TRANSVERSE_INDEX_X   CELL_IMAGE_INDEX_X_LEFT + 5
#define CELL_TRANSVERSE_INDEX_Y   CELL_IMAGE_INDEX_Y + CELL_IMAGE_HEIGHT + 10

#define CELL_INTRODUCE_ALL_HEIGHT CELL_LENGHT - (CELL_TRANSVERSE_INDEX_Y) - CELL_TRANSVERSE_HEIGHT
#define CELL_INTRODUCE_WIDTH      CELL_TRANSVERSE_WIDTH
#define CELL_INTRODUCE_HEIGHT     CELL_INTRODUCE_ALL_HEIGHT - (CELL_INTRODUCE_ALL_HEIGHT)/2
#define CELL_INTRODUCE_INDEX_X    CELL_TRANSVERSE_INDEX_X
#define CELL_INTRODUCE_INDEX_Y    CELL_IMAGE_INDEX_Y + CELL_IMAGE_HEIGHT + (CELL_INTRODUCE_ALL_HEIGHT) * 1/6

@interface BrandPageView()

@property (nonatomic, assign) CGSize cellsize;
@property (nonatomic, retain) UITapGestureRecognizer *tapGesture;

@end

@implementation BrandPageView

@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeValue];
        [self reloadData];
    }
    return self;
}

- (void)initializeValue {
    self.pagingEnabled = YES;
    self.clipsToBounds = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.autoresizesSubviews = NO;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.multipleTouchEnabled = NO;
    self.decelerationRate = UIScrollViewDecelerationRateFast;
    [self addGestureRecognizer:self.tapGesture];
}

- (void)reloadData {
    if (!self.delegate || ![self.delegate respondsToSelector:@selector(numberOfPageInPageScrollView:)]) {
        return;
    }
    if (!self.dataSource || ![self.dataSource respondsToSelector:@selector(pageScrollView:viewForRowAtIndex:)]) {
        return;
    }
    
    NSInteger numberOfCell = [self.delegate numberOfPageInPageScrollView:self];// 这里加一是因为背后有cell
    CGFloat startX = self.padding;
    CGFloat cellWidth = self.frame.size.width - self.padding;
    self.cellsize = CGSizeMake(cellWidth, CELL_LENGHT);  // 设置cellSize
    
    [[self subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
    
    /**
     *  CELL内布局规则:
     *  ----------------------------------------------
     *                |40:BLANK|
     *  ----------------------------------------------     ----------------------------------------------
     *                                                                      |30:BLANK|
     *                                                     ----------------------------------------------
     *                                                                      |23:TITLE|
     *                                                     ----------------------------------------------
     *                                                                      |15:BLANK|
     *                                                     ----------------------------------------------
     *                                                                  |IMAGE长度的1.3:IMAGE|
     *               |BG_IMAGE_VIEW|                       ----------------------------------------------
     *                                                                      |10:BLANK|
     *                                                     ----------------------------------------------
     *                                                                      |1.1:分割线|
     *                                                     ----------------------------------------------
     *                                                                   |剩余高度的1/6:BLANK|
     *                                                     ----------------------------------------------
     *                                                                 |剩余高度的3/6:introduce|
     *                                                     ----------------------------------------------
     *                                                                   |剩余高度的2/6:BLANK|
     *  ----------------------------------------------     ----------------------------------------------
     *                |10:BLANK|
     *  ----------------------------------------------
     */
    
    for (NSInteger i = 0; i < numberOfCell; i ++) {
        BrandPageViewCell *cell = [self.dataSource pageScrollView:self viewForRowAtIndex:i];
        cell.frame = CGRectMake(startX, VIEW_CELL_TOP_Y, cellWidth, CELL_LENGHT);
        // 各个子View的大小要在这里定义
        // 1.bgimageview
        cell.bgimageview.frame = CGRectMake(0, 0, cellWidth, CELL_LENGHT);
        // 2.titlelabel
        cell.titlelabel.frame  = CGRectMake(CELL_TITLE_INDEX_X, CELL_TITLE_INDEX_Y, CELL_TITLE_WIDTH , CELL_TITLE_LENGHT);
        // 3.imageview
        cell.imageview.frame   = CGRectMake(CELL_IMAGE_INDEX_X_LEFT, CELL_IMAGE_INDEX_Y, CELL_IMAGE_WIDTH, CELL_IMAGE_HEIGHT);
        // 4.introductionlabel
        cell.introductionlabel.frame = CGRectMake(CELL_INTRODUCE_INDEX_X, CELL_INTRODUCE_INDEX_Y, CELL_INTRODUCE_WIDTH, CELL_INTRODUCE_HEIGHT);
        // 5.transverse
        cell.transverse.frame  = CGRectMake(CELL_TRANSVERSE_INDEX_X, CELL_TRANSVERSE_INDEX_Y, CELL_TRANSVERSE_WIDTH, CELL_TRANSVERSE_HEIGHT);
        startX = startX + cellWidth + self.padding;
        [self addSubview:cell];
    }
    
    // 这里绘制最后一个ending作为最后的切图
    BrandPageViewCell *ending = [[BrandPageViewCell alloc]init];
    ending.frame = CGRectMake(startX, VIEW_CELL_TOP_Y, cellWidth, CELL_LENGHT);
    ending.bgimageview.frame = CGRectMake(0, 0, cellWidth, CELL_LENGHT);
    [self addSubview:ending];
    
    self.contentSize = CGSizeMake(startX - self.padding, self.frame.size.height);
}

#pragma mark - 基础属性

- (CGFloat)rightPadding {
    return self.frame.size.width / RIGHT_VIEW_CELL_RATIO;
}

- (CGFloat)padding {
    return VIEW_CELL_PADDING;
}

- (UITapGestureRecognizer*)tapGesture {
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        [_tapGesture setNumberOfTapsRequired:1];
        [_tapGesture setNumberOfTouchesRequired:1];
    }
    return _tapGesture;
}

#pragma mark - Action

- (void)handleTapGesture:(UITapGestureRecognizer*)tapGesture {
    CGPoint tapPoint = [tapGesture locationInView:self];
    
    BOOL yInCell = NO;
    if (tapPoint.y > VIEW_CELL_TOP_Y && tapPoint.y < self.frame.size.height- VIEW_CELL_BOTTOM){
        yInCell = YES;
    }
    int xInCellNumber = tapPoint.x / (self.cellsize.width + self.padding);
    BOOL xInCell = NO;
    if (tapPoint.x > ((self.cellsize.width + self.padding) * xInCellNumber)
        && tapPoint.x < ((self.cellsize.width + self.padding) * xInCellNumber) + self.cellsize.width) {
        xInCell = YES;
    }
    if (xInCellNumber < 0 || xInCellNumber >= [self.delegate numberOfPageInPageScrollView:self]) {
        xInCell = NO;
    }
    if (yInCell && xInCell) {
        [self.delegate pageScrollView:self didTapPageAtIndex:xInCellNumber];
    }
}


@end
