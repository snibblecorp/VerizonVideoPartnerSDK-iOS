//  Copyright 2018, Oath Inc.
//  Licensed under the terms of the MIT License. See LICENSE.md file in project root for terms.

import Foundation
import PlayerCore

/// Currently we support only InLine ads.
enum VASTModel {
    
    struct WrapperModel {
        let tagURL: URL
        let adVerifications: [PlayerCore.Ad.VASTModel.AdVerification]
        let pixels: PlayerCore.AdPixels
        let progress: [PlayerCore.Ad.VASTModel.AdProgress]
    }
    
    case wrapper(WrapperModel)
    case inline(PlayerCore.Ad.VASTModel)
}

extension PlayerCore.Ad.VASTModel {
    func merge(pixels: AdPixels,
               verifications: [PlayerCore.Ad.VASTModel.AdVerification],
               adProgress: [PlayerCore.Ad.VASTModel.AdProgress]) -> PlayerCore.Ad.VASTModel {
        return PlayerCore.Ad.VASTModel(
            adVerifications: self.adVerifications + verifications,
            mp4MediaFiles: mp4MediaFiles,
            vpaidMediaFiles: vpaidMediaFiles,
            skipOffset: skipOffset,
            clickthrough: clickthrough,
            adParameters: adParameters,
            adProgress: self.adProgress + adProgress,
            pixels: self.pixels.merge(with: pixels),
            id: id)
    }
}

extension PlayerCore.AdPixels {
    func merge(with pixels: AdPixels) -> AdPixels {
        return AdPixels(
            impression: impression + pixels.impression,
            error: error + pixels.error,
            clickTracking: clickTracking + pixels.clickTracking,
            creativeView: creativeView + pixels.creativeView,
            start: start + pixels.start,
            firstQuartile: firstQuartile + pixels.firstQuartile,
            midpoint: midpoint + pixels.midpoint,
            thirdQuartile: thirdQuartile + pixels.thirdQuartile,
            complete: complete + pixels.complete,
            pause: pause + pixels.pause,
            resume: resume + pixels.resume,
            skip: skip + pixels.skip,
            mute: mute + pixels.mute,
            unmute: unmute + pixels.unmute,
            acceptInvitation: acceptInvitation + pixels.acceptInvitation,
            acceptInvitationLinear: acceptInvitationLinear + pixels.acceptInvitationLinear,
            close: close + pixels.close,
            closeLinear: closeLinear + pixels.closeLinear,
            collapse: collapse + pixels.collapse
            
        )
    }
}
