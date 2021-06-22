//
//  SettingsViewController.m
//  Tipster
//
//  Created by Sabrina P Meng on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISlider *sliderValue;
@property (weak, nonatomic) IBOutlet UILabel *tipText;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int customTip = [defaults doubleForKey:@"default_tip_percentage"];
    self.sliderValue.value = customTip;
    self.tipText.text = [NSString stringWithFormat:@"Custom Tip: %d", customTip];
}

- (IBAction)setTipValue:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tipVal = (int) self.sliderValue.value;
    self.tipText.text = [NSString stringWithFormat:@"Custom Tip: %d", tipVal];
    [defaults setDouble:tipVal forKey:@"default_tip_percentage"];
    [defaults synchronize];
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
