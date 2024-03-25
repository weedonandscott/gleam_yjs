import * as Y from "yjs";

export function do_new() {
  return new Y.XmlFragment();
}

export function parent(xmlFragment) {
  return xmlFragment.parent;
}

export function firstChild(xmlFragment) {
  return xmlFragment.firstChild;
}

export function insert(xmlFragment, index, content) {
  return xmlFragment.insert(index, content);
}

export function delete_from_index(xmlFragment, index, length) {
  return xmlFragment.delete(index, length);
}

export function get(xmlFragment, index) {
  return xmlFragment.get(index);
}

export function slice(xmlFragment, start, end) {
  return xmlFragment.slice(start, end);
}

export function length(xmlFragment) {
  return xmlFragment.length;
}

export function clone(xmlFragment) {
  return xmlFragment.clone();
}

export function toArray(xmlFragment) {
  return xmlFragment.toArray();
}

export function toDOM(xmlFragment) {
  return xmlFragment.toDOM();
}

export function toString(xmlFragment) {
  return xmlFragment.toString();
}

export function toJSON(xmlFragment) {
  return xmlFragment.toJSON();
}

export function createTreeWalker(xmlFragment, filter) {
  return xmlFragment.createTreeWalker(filter);
}
