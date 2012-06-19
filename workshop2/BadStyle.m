#import <Foundation/Foundation.h>

int main(void) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *string = @"abc";
    NSString *string2 = [string stringByAppendingString:@"def"];
	int i;
    for (i=1; i<10; i++){
        printf("%s\n", [string2 cString]);
    }
    [pool release];
	return 0;
}