// Auto-generated. Do not edit!

// (in-package common_msgs_gl.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PointArray = require('../msg/PointArray.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SendPointArrayRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.points = null;
    }
    else {
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = new PointArray();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SendPointArrayRequest
    // Serialize message field [points]
    bufferOffset = PointArray.serialize(obj.points, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SendPointArrayRequest
    let len;
    let data = new SendPointArrayRequest(null);
    // Deserialize message field [points]
    data.points = PointArray.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += PointArray.getMessageSize(object.points);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common_msgs_gl/SendPointArrayRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9dbb4bd593812628a7a52a04aefa8ecb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    common_msgs_gl/PointArray points
    
    ================================================================================
    MSG: common_msgs_gl/PointArray
    int32[] x
    int32[] y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SendPointArrayRequest(null);
    if (msg.points !== undefined) {
      resolved.points = PointArray.Resolve(msg.points)
    }
    else {
      resolved.points = new PointArray()
    }

    return resolved;
    }
};

class SendPointArrayResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SendPointArrayResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SendPointArrayResponse
    let len;
    let data = new SendPointArrayResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common_msgs_gl/SendPointArrayResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SendPointArrayResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: SendPointArrayRequest,
  Response: SendPointArrayResponse,
  md5sum() { return '9dbb4bd593812628a7a52a04aefa8ecb'; },
  datatype() { return 'common_msgs_gl/SendPointArray'; }
};
