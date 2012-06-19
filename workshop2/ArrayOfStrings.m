#import <Foundation/Foundation.h>

int main(void) {
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	// Create an array
	NSArray *array = [NSArray arrayWithObjects:@"One",@"Two",@"Three",@"Four",nil];

	// Loop over the array and print each string
    int i;
    NSMutableArray *arr = [array mutableCopy];
    [arr removeObjectAtIndex:2];
    NSString *string = @"Eight"; 
    [arr addObject:string];
    
    //Sort array
    [arr sortUsingSelector:@selector(compare:)];
    
    for(i = 0; i < [arr count]; i++){
        printf("%s\n", [[arr objectAtIndex:i] cString]);
    }
    
	// TODO
	
	// Release memory
	[pool release];
	
	return 0;
}