//
//  TipViewController.m
//  Tipster
//
//  Created by Sabrina P Meng on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentagesControl;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UIView *billView;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;
@property (weak, nonatomic) IBOutlet UILabel *split2Text;
@property (weak, nonatomic) IBOutlet UILabel *split3Text;
@property (weak, nonatomic) IBOutlet UILabel *split4Text;
@property (weak, nonatomic) IBOutlet UIView *splitView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:true];
}

bool prevHidden = false;

- (IBAction)updateLabels:(id)sender {
    if (self.billField.text.length == 0) {
        [self hideLabels];
    }
    else if (self.billField.text.length > 0 && prevHidden == true) {
        [self showLabels];
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int customTip = [defaults doubleForKey:@"default_tip_percentage"];
    double tipPercentages[] = {0.15, 0.2, 0.25, (float) customTip/100};
    double tipPercentage = tipPercentages[self.tipPercentagesControl.selectedSegmentIndex];
    double bill = [self.billField.text  doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f", total];
    self.split2Text.text = [NSString stringWithFormat:@"%.2f", total/2];
    self.split3Text.text = [NSString stringWithFormat:@"%.2f", total/3];
    self.split4Text.text = [NSString stringWithFormat:@"%.2f", total/4];
}

-(void)hideLabels {
    [UIView animateWithDuration:0.5 animations:^{
        prevHidden = true;
        CGRect billFrame = self.billView.frame;
        billFrame.origin.y += 100;
        UIColor *color = [[UIColor alloc]initWithRed:123/255.0 green:221/255.0 blue:138/255.0 alpha:0.25];
        self.billView.backgroundColor = color;
        self.billView.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y += 100;
        
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 0;
        
        CGRect splitFrame = self.splitView.frame;
        splitFrame.origin.y += 100;
        
        self.splitView.frame = splitFrame;
        
        self.splitView.alpha = 0;
    }];
    
}

-(void)showLabels {
    [UIView animateWithDuration:0.5 animations:^{
        prevHidden = false;
        CGRect billFrame = self.billView.frame;
        billFrame.origin.y -= 100;
        UIColor *color = [[UIColor alloc]initWithRed:123/255.0 green:221/255.0 blue:138/255.0 alpha:1];
        self.billView.backgroundColor = color;
        self.billView.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y -= 100;
        
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 1;
        
        CGRect splitFrame = self.splitView.frame;
        splitFrame.origin.y -= 100;
        
        self.splitView.frame = splitFrame;
        
        self.splitView.alpha = 1;
    }];
    
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
