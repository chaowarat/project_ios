#import <Foundation/Foundation.h>

int main(void) {
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	// Loop from 1 to 10
	int i;
	for (i = 1; i <= 10; i++) {
		
		// Divide by 2
		float result = i / 2.0f;
		
		// Create a string object containing "1 / 2 = 0.5"
		NSString *string = [NSString stringWithFormat:@"%d / %d = %.1f", i, 2, result];
		
		// Print out the result
		printf("%s\n", [string cString]);
	}
	
	// Release memory
	[pool release];
	
	return 0;
}