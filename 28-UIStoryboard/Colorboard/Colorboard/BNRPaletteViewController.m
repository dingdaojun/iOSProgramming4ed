//
//  BNRPaletteViewController.m
//  Colorboard
//
//  Created by John Gallagher on 1/10/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRPaletteViewController.h"
#import "BNRColorDescription.h"
#import "BNRColorViewController.h"

@interface BNRPaletteViewController ()

@property (nonatomic) NSMutableArray *colors;

@end

@implementation BNRPaletteViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}

- (NSMutableArray *)colors
{
    if (!_colors) {
        _colors = [NSMutableArray array];
        BNRColorDescription *cd = [[BNRColorDescription alloc] init];
        [_colors addObject:cd];
    }
    return _colors;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                    forIndexPath:indexPath];

    BNRColorDescription *color = self.colors[indexPath.row];
    cell.textLabel.text = color.name;

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"NewColor"]) {

        // If we are adding a new color, create an instance
        // and add it to the colors array
        BNRColorDescription *color = [[BNRColorDescription alloc] init];
        [self.colors addObject:color];

        // Then use the segue to set the color on the view controller
        UINavigationController *nc =
            (UINavigationController *)segue.destinationViewController;
        BNRColorViewController *mvc =
            (BNRColorViewController *)[nc topViewController];
        mvc.colorDescription = color;
    } else if ([segue.identifier isEqualToString:@"ExistingColor"]) {

        // For the push segue, the sender is the UITableViewCell
        NSIndexPath *ip = [self.tableView indexPathForCell:sender];
        BNRColorDescription *color = self.colors[ip.row];

        // Set the color, and also tell the view controller that this
        // is an existing color
        BNRColorViewController *cvc =
            (BNRColorViewController *)segue.destinationViewController;
        cvc.colorDescription = color;
        cvc.existingColor = YES;
    }
}

@end
