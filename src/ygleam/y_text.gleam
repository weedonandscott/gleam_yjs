import gleam/option.{type Option}
import gleam/json
import ygleam/y.{
  type BaseType, type Transaction, type YDoc, type YText, type YType,
}
import ygleam/y_event.{type AnyYEvent, type YTextEvent}

@external(javascript, "../yText.mjs", "do_new")
pub fn new() -> YText

@external(javascript, "../yText.mjs", "doc")
pub fn doc(y_text: YText) -> Option(YDoc)

@external(javascript, "../yText.mjs", "parent")
pub fn parent(y_text: YText) -> Option(YType)

@external(javascript, "../yText.mjs", "insert")
pub fn insert(
  y_text: YText,
  index: Int,
  content: String,
  formattng_attributes: Option(List(#(String, json.Json))),
) -> Nil

@external(javascript, "../yText.mjs", "delete_from_index")
pub fn delete(y_text: YText, index: Int, length: Int) -> Nil

@external(javascript, "../yText.mjs", "format")
pub fn format(
  y_text: YText,
  index: Int,
  length: Int,
  formattng_attributes: List(#(String, json.Json)),
) -> Nil

// TODO
// @external(javascript, "../yText.mjs", "applyDelta")
// pub fn apply_delta(y_text: YText, delta, opts)

@external(javascript, "../yText.mjs", "length")
pub fn length(y_text: YText) -> Int

@external(javascript, "../yText.mjs", "toString")
pub fn to_string(y_text: YText) -> String

@external(javascript, "../yText.mjs", "toJSON")
pub fn to_json(y_text: YText) -> BaseType

// TODO
// @external(javascript, "../yText.mjs", "toDelta")
// pub fn to_delta(y_text: YText)

@external(javascript, "../yText.mjs", "observe")
pub fn observe(
  y_text: YText,
  cb: fn(YTextEvent, Transaction) -> Nil,
) -> fn() -> Nil

@external(javascript, "../yText.mjs", "observeDeep")
pub fn observe_deep(
  y_text: YText,
  cb: fn(List(AnyYEvent), Transaction) -> Nil,
) -> fn() -> Nil
