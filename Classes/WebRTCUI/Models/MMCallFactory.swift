//
//  MMCallFactory.swift
//  MobileMessaging
//
//  Created by Francisco Fortes on 19/08/2021.
//  Copyright © 2021 Infobip Ltd. All rights reserved.
//
import MobileMessaging
public struct MMWebRTCUIConstants {
    static let phoneNumber = "phoneNumber"
    static let autoAccept = "autoAccept"
    static let clientType = "clientType"
    static let pstn = "PSTN"
    static let webRTC = "WEBRTC"
    static let source = "source"
    static let displayName = "displayName"
    static let isOutbound = "isOutbound"
    static let isVideo = "isVideo"
    static let margin = 8.0
}

extension Int {
    var mmLocalisedCallErrorEvent: String? {
        switch self {
        case 5503, 5902, 5907: //EC_SERVICE_UNAVAILABLE, EC_INTERNAL_SERVER_ERROR, EC_TEMPORARILY_NOT_AVAILABLE
            return MMLoc.callsUsageError
        case 5801: // EC_USER_BUSY
            return MMLoc.userBusy
        case 5803, 5804, 5903, 5906: // EC_DEVICE_NOT_FOUND, EC_DEVICE_NOT_AVAILABLE,
            //EC_ERROR_DESTINATION_NOT_FOUND
            return MMLoc.userNotFoundDestination
        case 5603: // EC_DECLINE
            return MMLoc.userDeclinedCall
        case 5991: // EC_UNKNOWN_WEBRTC_ERROR, EC_CONNECTION_ERROR
            return MMLoc.somethingWentWrongPleaseContactSupport
        default:
            return nil
        }
    }
}

public enum MMCallType {
    case pstn
    case audio
    case video
    case conversationsAudio
    case conversationsVideo
    case conferenceAudio
    case conferenceVideo
    case application_audio
    case application_video
    case sipAudio
    case sipVideo
}
