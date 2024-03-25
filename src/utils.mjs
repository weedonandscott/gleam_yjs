import * as Y from "yjs";

import * as GleamIterator from "../gleam_stdlib/gleam/iterator.mjs";

import * as YGleam from "./ygleam/y.mjs";

export function bitArray(bitArray) {
  return bitArray.buffer;
}

export function isAnyYGleamType(obj) {
  return (
    obj instanceof YGleam.BaseType ||
    obj instanceof YGleam.YType ||
    obj instanceof YGleam.YDoc ||
    obj instanceof YGleam.YMap ||
    obj instanceof YGleam.YArray ||
    obj instanceof YGleam.YText ||
    obj instanceof YGleam.YXmlFragment ||
    obj instanceof YGleam.YXmlElement ||
    obj instanceof YGleam.AbstractType
  );
}

export function unwrapYValue(yvalue) {
  let actualValue = yvalue;
  while (isAnyYGleamType(actualValue)) {
    actualValue = actualValue.value;
  }

  return actualValue;
}

export function toYType(input) {
  if (input instanceof Y.Doc) {
    return new YGleam.YDoc(input);
  } else if (input instanceof Y.Map) {
    return new YGleam.YMap(input);
  } else if (input instanceof Y.Array) {
    return new YGleam.YArray(input);
  } else if (input instanceof Y.Text) {
    return new YGleam.YText(input);
  } else if (input instanceof Y.XmlFragment) {
    return new YGleam.YXmlFragment(input);
  } else if (input instanceof Y.XmlElement) {
    return new YGleam.YXmlElement(input);
  } else if (input instanceof Y.AbstractType) {
    return new YGleam.AbstractType(input);
  } else {
    return null;
  }
}

/**
 * !!!!IMPORTANT!!!!
 * THIS ASSUMES THE INPUT IS VALID YJS DATA
 * Only call this function to classify data received from Yjs.
 */
export function classifyKnownYValue(input) {
  const ytype = toYType(input);
  return ytype ? new YGleam.YType(ytype) : new YGleam.BaseType(input);
}

export function toGleamIterator(jsIterator, transformer) {
  return GleamIterator.unfold(jsIterator, (iter) => {
    const next = iter.next();
    if (!next || next.done) {
      return new GleamIterator.Done();
    } else {
      return new GleamIterator.Next(
        transformer ? transformer(next.value) : next.value,
        iter,
      );
    }
  });
}
