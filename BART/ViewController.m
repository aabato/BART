//
//  ViewController.m
//  BART
//
//  Created by Angelica Bato on 2/15/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *balloon;
@property (weak, nonatomic) IBOutlet UITextView *totalPointsLabel;
@property (weak, nonatomic) IBOutlet UITextView *currentTurnPointsLabel;
@property (weak, nonatomic) IBOutlet UIButton *inflateButton;
@property (weak, nonatomic) IBOutlet UIButton *cashOutButton;
@property (weak, nonatomic) IBOutlet UIButton *popButton;
@property (weak, nonatomic) IBOutlet UILabel *gameOverLabel;
@property (weak, nonatomic) IBOutlet UITextView *instructionsLabel;
@property (weak, nonatomic) IBOutlet UIButton *startNewGameButton;

@property (assign, nonatomic) NSUInteger numberOfTurns;
@property (assign, nonatomic) NSUInteger popLevel;
@property (assign, nonatomic) NSUInteger inflations;
@property (assign, nonatomic) NSUInteger currentTurnPoints;
@property (assign, nonatomic) NSUInteger totalPoints;
@property (assign, nonatomic) NSUInteger width;
@property (assign, nonatomic) NSUInteger height;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetGame];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)resetGame {
    self.startNewGameButton.enabled = NO;
    self.startNewGameButton.hidden = YES;
    self.inflations = 0;
    self.width = 80;
    self.height = 100;
    self.popButton.hidden = YES;
    self.popButton.enabled = NO;
    self.balloon.hidden = NO;
    self.balloon.frame = CGRectMake(0,0,self.width, self.height);
    self.balloon.center = self.balloon.superview.center;
    self.popLevel = arc4random_uniform(20);
    self.totalPoints = 0;
    self.currentTurnPoints = 0;
    self.numberOfTurns = 40;
    self.instructionsLabel.hidden = NO;
    self.currentTurnPointsLabel.hidden = NO;
    self.gameOverLabel.hidden = YES;
    self.inflateButton.enabled = YES;
    self.cashOutButton.enabled = YES;
    self.currentTurnPointsLabel.text = [NSString stringWithFormat:@"CURRENT TURN: %lu POINTS",self.currentTurnPoints];
    self.totalPointsLabel.text = [NSString stringWithFormat:@"BANKED: %lu POINTS", self.totalPoints];
    
}

-(void)resetBoard {
    self.numberOfTurns--;
    if (self.numberOfTurns != 0) {
        self.inflations = 0;
        self.width = 80;
        self.height = 100;
        self.popButton.hidden = YES;
        self.popButton.enabled = NO;
        self.balloon.hidden = NO;
        self.balloon.frame = CGRectMake(0,0,self.width, self.height);
        self.balloon.center = self.balloon.superview.center;
        self.popLevel = arc4random_uniform(128);
    }
    else {
        self.balloon.hidden = YES;
        self.popButton.hidden = YES;
        self.popButton.enabled = NO;
        self.inflateButton.enabled = NO;
        self.cashOutButton.enabled = NO;
        self.gameOverLabel.hidden = NO;
        self.currentTurnPointsLabel.hidden = YES;
        self.instructionsLabel.hidden = YES;
        self.startNewGameButton.hidden = NO;
        self.startNewGameButton.enabled = YES;
        
        
    }
    
}


- (IBAction)inflateButtonTapped:(id)sender {
    self.width += 8;
    self.height += 10;
    self.inflations++;
    if (self.inflations == self.popLevel) {
        self.balloon.hidden = YES;
        self.popButton.hidden = NO;
        self.popButton.enabled = YES;
        self.currentTurnPoints = 0;
        self.currentTurnPointsLabel.text = [NSString stringWithFormat:@"CURRENT TURN: %lu POINTS",self.currentTurnPoints];
        self.inflateButton.enabled = NO;
        self.cashOutButton.enabled = NO;
    }
    else {
        self.balloon.frame = CGRectMake(0,0,self.width, self.height);
        self.balloon.center = self.balloon.superview.center;
        self.currentTurnPoints += 5;
        self.currentTurnPointsLabel.text = [NSString stringWithFormat:@"CURRENT TURN: %lu POINTS",self.currentTurnPoints];
    }
    
    
}
- (IBAction)popButtonTapped:(id)sender {
    self.inflateButton.enabled = YES;
    self.cashOutButton.enabled = YES;
    [self resetBoard];
    
}

- (IBAction)cashOutButtonTapped:(id)sender {
    [self resetBoard];
    self.totalPoints += self.currentTurnPoints;
    self.currentTurnPoints = 0;
    self.totalPointsLabel.text = [NSString stringWithFormat:@"BANKED: %lu POINTS", self.totalPoints];
    self.currentTurnPointsLabel.text = [NSString stringWithFormat:@"CURRENT TURN: %lu POINTS", self.currentTurnPoints];
}


- (IBAction)startNewGameButtonTapped:(id)sender {
    [self resetGame];
}

@end
