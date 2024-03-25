import gleam/dynamic.{type Dynamic}
import gleam/json
import gleam/list
import gleam/option.{type Option, None, Some}

/// The BaseType type represents the basic Javascript types Yjs can hold:
///   - String
///   - Boolean
///   - Number
///   - Uint8Array
///   - Array<BaseType>
///   - Object<String, BaseType>
pub type BaseType

@external(javascript, "../../gleam_stdlib/gleam_stdlib.mjs", "identity")
fn coerce_gleam_json(a: json.Json) -> BaseType

pub fn string(input: String) -> BaseType {
  coerce_gleam_json(json.string(input))
}

pub fn bool(input: Bool) -> BaseType {
  coerce_gleam_json(json.bool(input))
}

pub fn int(input: Int) -> BaseType {
  coerce_gleam_json(json.int(input))
}

pub fn float(input: Float) -> BaseType {
  coerce_gleam_json(json.float(input))
}

@external(javascript, "../utils.mjs", "bitArray")
pub fn bit_array(input: BitArray) -> BaseType

pub fn null() -> BaseType {
  coerce_gleam_json(json.null())
}

pub fn nullable(
  from input: Option(a),
  of inner_type: fn(a) -> BaseType,
) -> BaseType {
  case input {
    Some(value) -> inner_type(value)
    None -> null()
  }
}

@external(javascript, "../../gleam_json/gleam_json_ffi.mjs", "object")
pub fn object(input: List(#(String, BaseType))) -> BaseType

pub fn array(
  from entries: List(a),
  of inner_type: fn(a) -> BaseType,
) -> BaseType {
  entries
  |> list.map(inner_type)
  |> preprocessed_array
}

@external(javascript, "../../gleam_json/gleam_json_ffi.mjs", "array")
pub fn preprocessed_array(from: List(BaseType)) -> BaseType

pub fn from_gleam_json(from: json.Json) -> BaseType {
  coerce_gleam_json(from)
}

pub type AbstractType

pub type Transaction

pub type YDoc

pub type YMap

pub type YArray

pub type YText

pub type YXmlFragment

pub type YXmlElement

pub type YType {
  AbstractType(value: AbstractType)
  YDoc(value: YDoc)
  YMap(value: YMap)
  YArray(value: YArray)
  YText(value: YText)
  YXmlFragment(value: YXmlFragment)
  YXmlElement(value: YXmlElement)
}

pub type YValue {
  // Can this be BaseType?
  BaseType(value: Dynamic)
  YType(value: YType)
}

pub fn decode(
  yvalue: YValue,
  decoder: dynamic.Decoder(a),
) -> Result(a, dynamic.DecodeErrors) {
  case yvalue {
    BaseType(value) -> decoder(value)
    _ ->
      Error([
        dynamic.DecodeError(expected: "BaseType", found: "YType", path: []),
      ])
  }
}
