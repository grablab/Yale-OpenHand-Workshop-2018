// Auto-generated. Do not edit!

// (in-package openhand.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class HoldServosRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.offset_scale = null;
    }
    else {
      if (initObj.hasOwnProperty('offset_scale')) {
        this.offset_scale = initObj.offset_scale
      }
      else {
        this.offset_scale = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HoldServosRequest
    // Serialize message field [offset_scale]
    bufferOffset = _serializer.int32(obj.offset_scale, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HoldServosRequest
    let len;
    let data = new HoldServosRequest(null);
    // Deserialize message field [offset_scale]
    data.offset_scale = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand/HoldServosRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '67b1f8b2dc0155309f8337c145c6af04';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 offset_scale
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HoldServosRequest(null);
    if (msg.offset_scale !== undefined) {
      resolved.offset_scale = msg.offset_scale;
    }
    else {
      resolved.offset_scale = 0
    }

    return resolved;
    }
};

class HoldServosResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.err = null;
    }
    else {
      if (initObj.hasOwnProperty('err')) {
        this.err = initObj.err
      }
      else {
        this.err = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HoldServosResponse
    // Serialize message field [err]
    bufferOffset = _serializer.int32(obj.err, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HoldServosResponse
    let len;
    let data = new HoldServosResponse(null);
    // Deserialize message field [err]
    data.err = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand/HoldServosResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b6e094011a4dfaee5eddf447220446cf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 err
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HoldServosResponse(null);
    if (msg.err !== undefined) {
      resolved.err = msg.err;
    }
    else {
      resolved.err = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: HoldServosRequest,
  Response: HoldServosResponse,
  md5sum() { return '9012ec588f6488638f420162efc2fcb2'; },
  datatype() { return 'openhand/HoldServos'; }
};
