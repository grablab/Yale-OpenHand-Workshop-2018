// Auto-generated. Do not edit!

// (in-package common_msgs_gl.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PointArray3D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.z = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = [];
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = [];
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PointArray3D
    // Serialize message field [x]
    bufferOffset = _arraySerializer.int32(obj.x, buffer, bufferOffset, null);
    // Serialize message field [y]
    bufferOffset = _arraySerializer.int32(obj.y, buffer, bufferOffset, null);
    // Serialize message field [z]
    bufferOffset = _arraySerializer.int32(obj.z, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PointArray3D
    let len;
    let data = new PointArray3D(null);
    // Deserialize message field [x]
    data.x = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [y]
    data.y = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [z]
    data.z = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.x.length;
    length += 4 * object.y.length;
    length += 4 * object.z.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'common_msgs_gl/PointArray3D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f40e33e8ca27d94205ca1e55520fcad2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] x
    int32[] y
    int32[] z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PointArray3D(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = []
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = []
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = []
    }

    return resolved;
    }
};

module.exports = PointArray3D;
