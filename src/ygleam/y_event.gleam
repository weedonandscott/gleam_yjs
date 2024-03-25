import gleam/option.{type Option}
import ygleam/y.{type Transaction, type YType, type YValue}

pub type YEvent

pub type YMapEvent

pub type YArrayEvent

pub type YTextEvent

pub type YXmlEvent

pub type AnyYEvent {
  BaseEvent(event: YEvent, changes_keys: ChangesKeys)
  MapEvent(event: YMapEvent, changes_keys: ChangesKeys)
  ArrayEvent(event: YArrayEvent, changes_keys: ChangesKeys)
  TextEvent(event: YTextEvent, changes_keys: ChangesKeys)
  XmlEvent(event: YXmlEvent, changes_keys: ChangesKeys)
}

pub type PathSection {
  NumberSection(Int)
  StringSection(String)
}

pub type ChangesKeys =
  List(#(String, String, Option(YValue)))

@external(javascript, "../yEvent.mjs", "target")
pub fn target(y_event: AnyYEvent) -> YType

@external(javascript, "../yEvent.mjs", "currentTarget")
pub fn current_target(y_event: AnyYEvent) -> YType

@external(javascript, "../yEvent.mjs", "transaction")
pub fn transaction(y_event: AnyYEvent) -> Transaction

@external(javascript, "../yEvent.mjs", "path")
pub fn path(y_event: AnyYEvent) -> List(PathSection)

// TODO: still no struct bindings
// @external(javascript, "../yEvent.mjs", "deletes")
// pub fn deletes(y_event: AnyYEvent, struct) -> Bool

// TODO
// @external(javascript, "../yEvent.mjs", "keys")
// pub fn keys(y_event: AnyYEvent) -> Dict(String, #(String, YValue, YValue))

// TODO: tricky to implement, see:
// https://github.com/yjs/yjs/blob/d730abe594ff1c149c75efb9c17549cf4b140eba/src/utils/YEvent.js#L141
// @external(javascript, "../yEvent.mjs", "delta")
// pub fn delta(y_event: AnyYEvent)

// TODO: still no struct bindings
// @external(javascript, "../yEvent.mjs", "adds")
// pub fn adds(y_event: AnyYEvent, struct)

// TODO: tricky to implement, see:
// https://github.com/yjs/yjs/blob/d730abe594ff1c149c75efb9c17549cf4b140eba/src/utils/YEvent.js#L165
// @external(javascript, "../yEvent.mjs", "changes")
// pub fn changes(y_event: AnyYEvent)

@external(javascript, "../yEvent.mjs", "keysChanged")
pub fn map_keys_changed(y_map_event: YMapEvent) -> List(String)

@external(javascript, "../yEvent.mjs", "keysChanged")
pub fn text_keys_changed(y_text_event: YTextEvent) -> List(String)

@external(javascript, "../yEvent.mjs", "attributesChanged")
pub fn xml_attributes_changed(y_xml_event: YXmlEvent) -> List(String)
