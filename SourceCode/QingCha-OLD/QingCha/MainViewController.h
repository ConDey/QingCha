//
//  ViewController.h
//  QingCha
//
//  Created by eazytec on 15/12/2.
//  Copyright © 2015年 ConDey. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIBrandView.h"
#import "ICSDrawerController.h"
#import "MenuViewController.h"

@interface MainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UIBrandViewDelegate,ICSDrawerControllerChild, ICSDrawerControllerPresenting, MenuViewControllerDelegate >

@property(nonatomic, weak) ICSDrawerController *drawer;

@end

