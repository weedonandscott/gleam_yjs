import * as Y from "yjs";

export function do_new() {
  return new Y.XmlElement();
}

export function parent(xmlElement) {
  return xmlElement.parent;
}

export function firstChild(xmlElement) {
  return xmlElement.firstChild;
}

export function nextSibling(xmlElement) {
  return xmlElement.nextSibling;
}

export function prevSibling(xmlElement) {
  return xmlElement.prevSibling;
}

export function insert(xmlElement, index, content) {
  return xmlElement.insert(index, content);
}

export function delete_from_index(xmlElement, index, length) {
  return xmlElement.delete(index, length);
}

export function get(xmlElement, index) {
  return xmlElement.get(index);
}

export function length(xmlElement) {
  return xmlElement.length;
}

export function setAttribute(xmlElement, attributeName, attributeValue) {
  return xmlElement.setAttribute(attributeName, attributeValue);
}

export function removeAttribute(xmlElement, attributeName) {
  return xmlElement.removeAttribute(attributeName);
}

export function getAttribute(xmlElement, attributeName) {
  return xmlElement.getAttribute(attributeName);
}

export function getAttributes(xmlElement) {
  return xmlElement.getAttributes();
}

export function slice(xmlElement, start, end) {
  return xmlElement.slice(start, end);
}

export function clone(xmlElement) {
  return xmlElement.clone();
}

export function toArray(xmlElement) {
  return xmlElement.toArray();
}

export function toDOM(xmlElement) {
  return xmlElement.toDOM();
}

export function toString(xmlElement) {
  return xmlElement.toString();
}

export function toJSON(xmlElement) {
  return xmlElement.toJSON();
}
