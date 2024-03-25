import * as Y from "yjs";

import { unwrap } from "../gleam_stdlib/gleam/option.mjs";

export function do_new() {
  return new Y.Text();
}

export function doc(yText) {
  return AbstractType.doc(yText);
}

export function parent(yText) {
  return AbstractType.parent(yText);
}

export function insert(ytext, index, content, formattingAttributes) {
  const attributesEntries = unwrap(formattingAttributes, undefined);
  const attributes = attributesEntries
    ? Object.fromEntries(attributesEntries)
    : undefined;
  return ytext.insert(index, content, attributes);
}

// `delete` is a reserved word
export function delete_from_index(ytext, index, length) {
  return ytext.delete(index, length);
}

export function format(ytext, index, length, formattingAttributes) {
  const attributesEntries = unwrap(formattingAttributes, undefined);
  const attributes = attributesEntries
    ? Object.fromEntries(attributesEntries)
    : undefined;
  return ytext.format(index, length, attributes);
}

export function applyDelta(ytext, delta, opts) {
  return ytext.applyDelta(delta, opts);
}

export function length(ytext) {
  return ytext.length;
}

export function toString(ytext) {
  return ytext.toString();
}

export function toJSON(ytext) {
  return ytext.toJSON();
}

export function toDelta(ytext) {
  return ytext.toDelta();
}

export function observe(yMap, cb) {
  return AbstractType.observe(yMap, cb);
}

export function observeDeep(yMap, cb) {
  return AbstractType.observeDeep(yMap, cb);
}
