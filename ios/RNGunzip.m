
#import "RNGunzip.h"

@interface RNGunzip ()

@end

@implementation RNGunzip

RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(gunzip,
                 filePath: (NSString *) source
                 toFolder: (NSString *) folder
                 resolver: (RCTPromiseResolveBlock)resolve
                 rejecter: (RCTPromiseRejectBlock)reject)
{
    
    
    NSFileManager *manager = [NSFileManager defaultManager];

    if (![manager fileExistsAtPath:source]) {
        reject(@"-2", @"file not found", nil);
        return;
    }

    if (![DCTar decompressFileAtPath:source toPath:folder error:nil]) {
      reject(@"-3", @"error while decompressing", nil);
       return;
    }

    resolve(@{@"path": folder});
}

@end
