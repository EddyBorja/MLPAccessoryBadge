//
//  DEMOViewController.h
//  MLPAccessoryBadgeDemo
//
//  Created by Eddy Borja on 4/8/13.
//  Copyright (c) 2013 Mainloop LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DEMOViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
