//
//  MenuViewController.m
//  QingCha
//
//  Created by eazytec on 15/12/21.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import "MenuViewController.h"
#import "UIConstranits.h"

#import "MenuHeadTableViewCell.h"
#import "MenuTableViewCell.h"

@interface MenuViewController ()

@property (nonatomic,retain) UITableView *menuTableView;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 菜单view
    _menuTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _menuTableView.backgroundColor = [UIColor blackColor];
    _menuTableView.delegate    = self;
    _menuTableView.dataSource  = self;
    
    _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_menuTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        MenuHeadTableViewCell *cell = [[MenuHeadTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuHeadTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        MenuTableViewCell *cell = [[MenuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuTableViewCell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 1) {
            cell.headImageview.image = [UIImage imageNamed:@"Products_Image2"];
            cell.titleLabel.text = @"用户注册";
        } else if (indexPath.row == 2) {
            cell.headImageview.image = [UIImage imageNamed:@"Products_Image1"];
            cell.titleLabel.text = @"我的收藏";
        } else{
            cell.headImageview.image = [UIImage imageNamed:@"Products_Image3"];
            cell.titleLabel.text = @"意见反馈";
        }
        return  cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 140;
    }else {
        return 60;
    }
    return 0;
}

// 点击跳转事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
            [self.delegate pushToSegues:@"MainToUserSegue"];
            [self.drawer close];
    }
}

#pragma mark - Table view setting

// 自定义TableViewCell分割线, 清除前面15PX的空白
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


#pragma mark - Configuring the view’s layout behavior

- (UIStatusBarStyle)preferredStatusBarStyle {
    // Even if this view controller hides the status bar, implementing this method is still needed to match the center view controller's
    // status bar style to avoid a flicker when the drawer is dragged and then left to open.
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}


@end
