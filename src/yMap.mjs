import * as Y from "yjs";

import * as AbstractType from "./abstractType.mjs";
import {
  classifyKnownYValue,
  toGleamIterator,
  unwrapYValue,
} from "./utils.mjs";

export function do_new() {
  return new Y.Map();
}

export function doc(yMap) {
  return AbstractType.doc(yMap);
}

export function parent(yMap) {
  return AbstractType.parent(yMap);
}

export function set(yMap, key, value) {
  yMap.set(key, unwrapYValue(value));

  return yMap;
}

export function setDynamic(yMap, key, value) {
  yMap.set(key, value);

  return yMap;
}

export function get(yMap, key) {
  return classifyKnownYValue(yMap.get(key));
}

export function getDynamic(yMap, key) {
  return yMap.get(key);
}

// `delete` is a reserved word
export function deleteKey(yMap, key) {
  yMap.delete(key);

  return yMap;
}

export function has(yMap, key) {
  return yMap.has(key);
}

export function toJSON(yMap) {
  return yMap.toJSON();
}

export function size(yMap) {
  return yMap.size;
}

export function forEach(yMap, cb) {
  yMap.forEach((yValue, index, yMap) =>
    cb(classifyKnownYValue(yValue), index, yMap),
  );

  return yMap;
}

export function entries(yMap) {
  return toGleamIterator(yMap.entries(), (key, yValue) => [
    key,
    classifyKnownYValue(yValue),
  ]);
}

export function values(yMap) {
  return toGleamIterator(yMap.values(), (yValue) =>
    classifyKnownYValue(yValue),
  );
}

export function keys(yMap) {
  return toGleamIterator(yMap.keys());
}

export function clone(yMap) {
  return yMap.clone();
}

export function observe(yMap, cb) {
  return AbstractType.observe(yMap, cb);
}

export function observeDeep(yMap, cb) {
  return AbstractType.observeDeep(yMap, cb);
}
