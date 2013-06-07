//
//  DEMOViewController.m
//  MLPAccessoryBadgeDemo
//
//  Created by Eddy Borja on 4/8/13.
//  Copyright (c) 2013 Mainloop LLC. All rights reserved.
//

#import "DEMOViewController.h"
#import "MLPAccessoryBadge.h"
#import "UIColor+MLPFlatColors.h"
#import <QuartzCore/QuartzCore.h>

@interface DEMOViewController ()
@property (strong) NSArray *badgeColors;
@end

@implementation DEMOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    

    [self setBadgeColors:@[[UIColor flatOrangeColor],
                           [UIColor flatBlueColor],
                           [UIColor greenColor],
                           [UIColor flatDarkBlackColor],
                           [UIColor flatYellowColor],
                           [UIColor flatRedColor],
                           [UIColor flatGreenColor],
                           [UIColor flatOrangeColor],
                           [UIColor flatWhiteColor],
                           [UIColor flatRedColor],
                           [UIColor flatTealColor],
                           [UIColor flatPurpleColor],
                           [UIColor flatGrayColor]]];
     
     
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.view setAlpha:0];
    [UIView animateWithDuration:0.2
                          delay:0.25
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self.view setAlpha:1.0];
                     }completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 17;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    MLPAccessoryBadge *accessoryBadge;
    [cell.textLabel setText:nil];
    switch (indexPath.row) {
        case 0:
            [cell.textLabel setText:@"(Rectangle Badge)"];
            accessoryBadge = [MLPAccessoryBadge new];
            [accessoryBadge setText:@"Hi!"];
            [accessoryBadge setBackgroundColor:[UIColor flatRedColor]];
            break;
        case 1:
            [cell.textLabel setText:@"(Arrow Badge)"];
            accessoryBadge = [MLPAccessoryBadgeArrow new];
            [accessoryBadge setText:@"38 results"];
            [accessoryBadge setBackgroundColor:[UIColor flatOrangeColor]];
            break;
        case 2:
            [cell.textLabel setText:@"(Badge + Chevron)"];
            accessoryBadge = [MLPAccessoryBadgeChevron new];
            [accessoryBadge setText:@"Autoresizing!"];
            [accessoryBadge setBackgroundColor:[UIColor flatYellowColor]];
            break;
        case 3:
            
            [cell.textLabel setText:@"(Embossed Badge)"];
            accessoryBadge = [MLPAccessoryBadgeEmboss new];
            [accessoryBadge setText:@"No Graphic Files"];
            [accessoryBadge.textLabel setFont:[UIFont fontWithName:@"Helvetica-BoldOblique"
                                                              size:12]];
            [accessoryBadge setBackgroundColor:[UIColor flatGreenColor]];
            break;
        case 4:
            accessoryBadge = [MLPAccessoryBadge new];
            [accessoryBadge setCornerRadius:6];
            [accessoryBadge setText:@"Specify Corner Radius!"];
            [accessoryBadge setBackgroundColor:[UIColor flatTealColor]];
            [accessoryBadge setStrokeColor:[UIColor flatDarkWhiteColor]];
            [accessoryBadge setStrokeWidth:3];
            break;
        case 5:
            accessoryBadge = [MLPAccessoryBadgeArrow new];
            [accessoryBadge setCornerRadius:10];
            [accessoryBadge setText:@"Set your own colors!"];
            [accessoryBadge setTextColor:[UIColor flatBlackColor]];
            [accessoryBadge setBackgroundColor:[UIColor flatBlueColor]];
            break;
        case 6:
            accessoryBadge = [MLPAccessoryBadgeChevron new];
            [accessoryBadge setCornerRadius:100];
            [accessoryBadge setTextWithNumber:@2];
            [accessoryBadge setBackgroundColor:[UIColor flatPurpleColor]];
            break;
        case 7:
            accessoryBadge = [MLPAccessoryBadgeEmboss new];
            [accessoryBadge setCornerRadius:8];
            [accessoryBadge setText:@"!"];
            [accessoryBadge.textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold"
                                                              size:16]];
            [accessoryBadge setBackgroundColor:[UIColor flatBlackColor]];
            [accessoryBadge setTextColor:[UIColor flatYellowColor]];
            break;
        case 8:
            accessoryBadge = [MLPAccessoryBadge new];
            [accessoryBadge setText:@"Control Shading"];
            [accessoryBadge.textLabel setShadowOffset:CGSizeZero];
            [accessoryBadge setCornerRadius:0];
            [accessoryBadge setHighlightAlpha:0];
            [accessoryBadge setShadowAlpha:0];
            [accessoryBadge setBackgroundColor:[UIColor flatGrayColor]];
            [accessoryBadge setGradientAlpha:0];
            break;
        case 9:
            accessoryBadge = [MLPAccessoryBadgeArrow new];
            [accessoryBadge.textLabel setFont:[UIFont fontWithName:@"Avenir-LightOblique"
                                                              size:16]];
            [accessoryBadge setText:@"Use any font"];
            [accessoryBadge setTextColor:[UIColor flatBlackColor]];
            [accessoryBadge setBackgroundColor:[UIColor flatWhiteColor]];
            break;
        case 10:
            accessoryBadge = [MLPAccessoryBadgeChevron new];
            [accessoryBadge setText:@"Hidden Badge"];
            [accessoryBadge setBadgeHidden:YES];
            [accessoryBadge setBackgroundColor:[UIColor flatDarkPurpleColor]];
            break;
        case 11:
            [cell.textLabel setText:@"Check the sample code."];
            accessoryBadge = [MLPAccessoryBadgeEmboss new];
            [accessoryBadge setCornerRadius:100];
            [accessoryBadge setText:@"!"];
            [accessoryBadge.textLabel setFont:[UIFont fontWithName:accessoryBadge.textLabel.font.fontName size:20]];
            [accessoryBadge setBadgeMinimumSize:CGSizeMake(32, 32)];
            [accessoryBadge setBackgroundColor:[UIColor flatDarkBlueColor]];
            break;
        case 12:
            accessoryBadge = [MLPAccessoryBadge new];
            [accessoryBadge setCornerRadius:100];
            [accessoryBadge setText:@"?"];
            [accessoryBadge.textLabel setFont:[UIFont fontWithName:accessoryBadge.textLabel.font.fontName size:20]];
            [accessoryBadge setBadgeMinimumSize:CGSizeMake(32, 32)];
            [accessoryBadge setBackgroundColor:[UIColor flatDarkTealColor]];
            break;
        case 13:
            accessoryBadge = [MLPAccessoryBadgeArrow new];
            [accessoryBadge setText:@"This way!"];
            [accessoryBadge setBackgroundColor:[UIColor flatDarkGreenColor]];
            break;
        case 14:
            accessoryBadge = [MLPAccessoryBadgeChevron new];
            [accessoryBadge setTextWithNumber:@4];
            [accessoryBadge setBackgroundColor:[UIColor flatDarkYellowColor]];
            break;
        case 15:
            accessoryBadge = [MLPAccessoryBadgeEmboss new];
            [accessoryBadge setText:@"Active"];
            [accessoryBadge setBackgroundColor:[UIColor flatDarkOrangeColor]];
            break;
        case 16:
        default:
            accessoryBadge = [MLPAccessoryBadge new];
            [accessoryBadge setText:@"PRO"];
            [accessoryBadge setBackgroundColor:[UIColor flatDarkRedColor]];
            break;
    }
    

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setAccessoryView:accessoryBadge];

    [cell.textLabel setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:16]];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    
    
    
    return cell;
}



@end
