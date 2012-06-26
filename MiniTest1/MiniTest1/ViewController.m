//
//  ViewController.m
//  MiniTest1
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create a label containing some text
    inputLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 280, 30)];
    inputLabel.text = @"1+2+3+4+5";
    inputLabel.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:inputLabel];
    
    //creaate button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(120, 100, 100, 30)];
    [button setTitle:@"Calculate" forState:UIControlStateNormal];
    [[self view] addSubview:button];
    
    //add label for result
    outputLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 180, 280, 30)];
    outputLabel.textAlignment = UITextAlignmentCenter;
    outputLabel.textColor = [UIColor redColor];
    
    [[self view] addSubview:outputLabel];
    
    //call method
    [button addTarget:self action:@selector(calculate:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)calculate:(id)sender {
    NSArray *array = [inputLabel.text componentsSeparatedByString:@"+"];
    
    int i = 0, sum = 0;
    for (i = 0; i < [array count]; i++) {
        sum += [[array objectAtIndex:i] intValue];
    }
    NSString *string = [NSString stringWithFormat:@"Answer is %d",sum];
    
    outputLabel.text = string;    
}

@end
