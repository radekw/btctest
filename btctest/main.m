//
//  main.m
//  btctest
//
//  Created by Radek Wierzbicki on 11/4/12.
//  Copyright (c) 2012 Radek Wierzbicki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IOBluetooth/objc/IOBluetoothDevice.h>
#import <IOBluetooth/objc/IOBluetoothDeviceInquiry.h>


int main(int argc, const char * argv[]) {
    
    int result = EXIT_SUCCESS;

    @autoreleasepool {
        if (argc!=2) {
            printf("Usage: btctest <BT mac address>\n");
            exit(1);
        }
                
        NSString *mac_address = [NSString stringWithUTF8String:argv[1]];
        IOBluetoothDevice *device;
        
        //NSLog(@"Connecting to %@", mac_address);
        printf("Connecting to %s ... ", [mac_address UTF8String]);
        
        device = [IOBluetoothDevice deviceWithAddressString:mac_address];
        
        [device openConnection];
        
        if ([device isConnected]) {
            printf("OK");
            result = EXIT_SUCCESS;
        } else {
            printf("FAILED");
            result = EXIT_FAILURE;
        }
        
        [device closeConnection];
        
        printf("\n");
    }
    
    
    return result;
}

