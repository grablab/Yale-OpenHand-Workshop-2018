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

class ReadTemperatureRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ReadTemperatureRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ReadTemperatureRequest
    let len;
    let data = new ReadTemperatureRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand/ReadTemperatureRequest';
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
    const resolved = new ReadTemperatureRequest(null);
    return resolved;
    }
};

class ReadTemperatureResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.temp = null;
    }
    else {
      if (initObj.hasOwnProperty('temp')) {
        this.temp = initObj.temp
      }
      else {
        this.temp = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ReadTemperatureResponse
    // Serialize message field [temp]
    bufferOffset = _arraySerializer.float32(obj.temp, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ReadTemperatureResponse
    let len;
    let data = new ReadTemperatureResponse(null);
    // Deserialize message field [temp]
    data.temp = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.temp.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand/ReadTemperatureResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '52444e69c3eaa80dd939a5bad6dbe319';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] temp
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ReadTemperatureResponse(null);
    if (msg.temp !== undefined) {
      resolved.temp = msg.temp;
    }
    else {
      resolved.temp = []
    }

    return resolved;
    }
};

module.exports = {
  Request: ReadTemperatureRequest,
  Response: ReadTemperatureResponse,
  md5sum() { return '52444e69c3eaa80dd939a5bad6dbe319'; },
  datatype() { return 'openhand/ReadTemperature'; }
};
