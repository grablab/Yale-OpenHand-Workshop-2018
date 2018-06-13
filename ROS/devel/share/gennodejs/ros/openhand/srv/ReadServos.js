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

class ReadServosRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ReadServosRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ReadServosRequest
    let len;
    let data = new ReadServosRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand/ReadServosRequest';
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
    const resolved = new ReadServosRequest(null);
    return resolved;
    }
};

class ReadServosResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pos = null;
      this.enc = null;
      this.ref = null;
    }
    else {
      if (initObj.hasOwnProperty('pos')) {
        this.pos = initObj.pos
      }
      else {
        this.pos = [];
      }
      if (initObj.hasOwnProperty('enc')) {
        this.enc = initObj.enc
      }
      else {
        this.enc = [];
      }
      if (initObj.hasOwnProperty('ref')) {
        this.ref = initObj.ref
      }
      else {
        this.ref = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ReadServosResponse
    // Serialize message field [pos]
    bufferOffset = _arraySerializer.float32(obj.pos, buffer, bufferOffset, null);
    // Serialize message field [enc]
    bufferOffset = _arraySerializer.int32(obj.enc, buffer, bufferOffset, null);
    // Serialize message field [ref]
    bufferOffset = _arraySerializer.float32(obj.ref, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ReadServosResponse
    let len;
    let data = new ReadServosResponse(null);
    // Deserialize message field [pos]
    data.pos = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [enc]
    data.enc = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [ref]
    data.ref = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.pos.length;
    length += 4 * object.enc.length;
    length += 4 * object.ref.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand/ReadServosResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '662e32bfc46f37715bb1455cf7d299a9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] pos
    int32[] enc
    float32[] ref
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ReadServosResponse(null);
    if (msg.pos !== undefined) {
      resolved.pos = msg.pos;
    }
    else {
      resolved.pos = []
    }

    if (msg.enc !== undefined) {
      resolved.enc = msg.enc;
    }
    else {
      resolved.enc = []
    }

    if (msg.ref !== undefined) {
      resolved.ref = msg.ref;
    }
    else {
      resolved.ref = []
    }

    return resolved;
    }
};

module.exports = {
  Request: ReadServosRequest,
  Response: ReadServosResponse,
  md5sum() { return '662e32bfc46f37715bb1455cf7d299a9'; },
  datatype() { return 'openhand/ReadServos'; }
};
