// Auto-generated. Do not edit!

// (in-package common_msgs_gl.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SendDoubleArrayReceiveIntDoubleRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SendDoubleArrayReceiveIntDoubleRequest
    // Serialize message field [data]
    bufferOffset = _arraySerializer.float64(obj.data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SendDoubleArrayReceiveIntDoubleRequest
    let len;
    let data = new SendDoubleArrayReceiveIntDoubleRequest(null);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.data.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common_msgs_gl/SendDoubleArrayReceiveIntDoubleRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '788898178a3da2c3718461eecda8f714';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SendDoubleArrayReceiveIntDoubleRequest(null);
    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    return resolved;
    }
};

class SendDoubleArrayReceiveIntDoubleResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data_int = null;
      this.data_double = null;
    }
    else {
      if (initObj.hasOwnProperty('data_int')) {
        this.data_int = initObj.data_int
      }
      else {
        this.data_int = 0;
      }
      if (initObj.hasOwnProperty('data_double')) {
        this.data_double = initObj.data_double
      }
      else {
        this.data_double = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SendDoubleArrayReceiveIntDoubleResponse
    // Serialize message field [data_int]
    bufferOffset = _serializer.int32(obj.data_int, buffer, bufferOffset);
    // Serialize message field [data_double]
    bufferOffset = _serializer.float64(obj.data_double, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SendDoubleArrayReceiveIntDoubleResponse
    let len;
    let data = new SendDoubleArrayReceiveIntDoubleResponse(null);
    // Deserialize message field [data_int]
    data.data_int = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [data_double]
    data.data_double = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common_msgs_gl/SendDoubleArrayReceiveIntDoubleResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7c42095768b77f042229b8ce6db53738';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 data_int
    float64 data_double
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SendDoubleArrayReceiveIntDoubleResponse(null);
    if (msg.data_int !== undefined) {
      resolved.data_int = msg.data_int;
    }
    else {
      resolved.data_int = 0
    }

    if (msg.data_double !== undefined) {
      resolved.data_double = msg.data_double;
    }
    else {
      resolved.data_double = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: SendDoubleArrayReceiveIntDoubleRequest,
  Response: SendDoubleArrayReceiveIntDoubleResponse,
  md5sum() { return 'ca79180c13450f9faa7d51f5b725d04b'; },
  datatype() { return 'common_msgs_gl/SendDoubleArrayReceiveIntDouble'; }
};
