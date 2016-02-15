//
//  openingViewController.m
//  BART
//
//  Created by Angelica Bato on 2/15/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import "openingViewController.h"

@interface openingViewController ()
@property (weak, nonatomic) IBOutlet UILabel *instructions;

@end

@implementation openingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.instructions.text = @"INSTRUCTIONS: \n\nThis is game where you earn points for inflating a balloon. The goal is to earn as many points as possible. \n\nEach inflation is worth 5 points. The more you inflate, the more points you earn. However, if you inflate it too much, the balloon will pop and you will lose all the points you earn on that balloon. \n\nTo avoid losing your points, you can cash out BEFORE the balloon pops. \n\nThere is a limited number of balloons, so try to earn as many points as possible on each balloon!";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
