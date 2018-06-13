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

class ReadLoadRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ReadLoadRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ReadLoadRequest
    let len;
    let data = new ReadLoadRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand/ReadLoadRequest';
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
    const resolved = new ReadLoadRequest(null);
    return resolved;
    }
};

class ReadLoadResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.load = null;
    }
    else {
      if (initObj.hasOwnProperty('load')) {
        this.load = initObj.load
      }
      else {
        this.load = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ReadLoadResponse
    // Serialize message field [load]
    bufferOffset = _arraySerializer.float32(obj.load, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ReadLoadResponse
    let len;
    let data = new ReadLoadResponse(null);
    // Deserialize message field [load]
    data.load = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.load.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand/ReadLoadResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '484bc5de2725aa512e1b0578d3e540c4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] load
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ReadLoadResponse(null);
    if (msg.load !== undefined) {
      resolved.load = msg.load;
    }
    else {
      resolved.load = []
    }

    return resolved;
    }
};

module.exports = {
  Request: ReadLoadRequest,
  Response: ReadLoadResponse,
  md5sum() { return '484bc5de2725aa512e1b0578d3e540c4'; },
  datatype() { return 'openhand/ReadLoad'; }
};
