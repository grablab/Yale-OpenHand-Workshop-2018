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

class ReadCurrentRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ReadCurrentRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ReadCurrentRequest
    let len;
    let data = new ReadCurrentRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand/ReadCurrentRequest';
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
    const resolved = new ReadCurrentRequest(null);
    return resolved;
    }
};

class ReadCurrentResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.curr = null;
    }
    else {
      if (initObj.hasOwnProperty('curr')) {
        this.curr = initObj.curr
      }
      else {
        this.curr = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ReadCurrentResponse
    // Serialize message field [curr]
    bufferOffset = _arraySerializer.float32(obj.curr, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ReadCurrentResponse
    let len;
    let data = new ReadCurrentResponse(null);
    // Deserialize message field [curr]
    data.curr = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.curr.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand/ReadCurrentResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '640c8d4d28b8ccb823cd749d0957df5a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] curr
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ReadCurrentResponse(null);
    if (msg.curr !== undefined) {
      resolved.curr = msg.curr;
    }
    else {
      resolved.curr = []
    }

    return resolved;
    }
};

module.exports = {
  Request: ReadCurrentRequest,
  Response: ReadCurrentResponse,
  md5sum() { return '640c8d4d28b8ccb823cd749d0957df5a'; },
  datatype() { return 'openhand/ReadCurrent'; }
};
