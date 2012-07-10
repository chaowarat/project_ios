//
//  ViewController.m
//  MiniTest1
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    label.text = @"";
    [label setBackgroundColor:[UIColor whiteColor]];

}

- (IBAction)calculate:(id)sender {
    NSArray *array = [label.text componentsSeparatedByString:@"+"];
    
    int i, sum = 0;
    for (i = 0; i < [array count]; i++) {
        sum += [[array objectAtIndex:i] intValue];
    }
    NSString *string = [NSString stringWithFormat:@"%d",sum];
    
    label.text = string;   
}

- (IBAction)touchNumber:(id)sender{
    NSString *value = label.text;
    value = [value stringByAppendingString:[[sender titleLabel] text]];
    label.text = value;
}

@end
