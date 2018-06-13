
"use strict";

let HoldServos = require('./HoldServos.js')
let ReadServos = require('./ReadServos.js')
let MoveServos = require('./MoveServos.js')
let ReadTemperature = require('./ReadTemperature.js')
let ReadCurrent = require('./ReadCurrent.js')
let ReadLoad = require('./ReadLoad.js')
let TorqueServos = require('./TorqueServos.js')

module.exports = {
  HoldServos: HoldServos,
  ReadServos: ReadServos,
  MoveServos: MoveServos,
  ReadTemperature: ReadTemperature,
  ReadCurrent: ReadCurrent,
  ReadLoad: ReadLoad,
  TorqueServos: TorqueServos,
};
