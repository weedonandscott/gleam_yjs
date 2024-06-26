import gleam/int
import gleam/list
import gleam/option.{type Option}
import gleam/order
import ygleam/y.{
  type BaseType, type Transaction, type YArray, type YDoc, type YType,
  type YValue,
}
import ygleam/y_event.{type AnyYEvent, type YArrayEvent}

pub type YArrayError {
  YArrayError
  LengthExceeded
}

@external(javascript, "../yArray.mjs", "do_new")
pub fn new() -> YArray

@external(javascript, "../yArray.mjs", "doc")
pub fn doc(y_array: YArray) -> Option(YDoc)

@external(javascript, "../yArray.mjs", "parent")
pub fn parent(y_array: YArray) -> Option(YType)

@external(javascript, "../yArray.mjs", "from")
pub fn from(items: List(YValue)) -> YArray

@external(javascript, "../yArray.mjs", "length")
pub fn length(y_array: YArray) -> Int

@external(javascript, "../yArray.mjs", "insert")
pub fn insert(
  y_array: YArray,
  index: Int,
  items: List(YValue),
) -> Result(YArray, YArrayError)

@external(javascript, "../yArray.mjs", "delete_from_index")
pub fn delete(
  y_array: YArray,
  index: Int,
  length: Int,
) -> Result(YArray, YArrayError)

pub fn delete_where(y_array: YArray, predicate: fn(YValue) -> Bool) -> YArray {
  y_array
  |> map(fn(value, index, _) {
    case predicate(value) {
      True -> Ok(index)
      False -> Error(Nil)
    }
  })
  |> list.filter_map(fn(x) { x })
  |> list.sort(order.reverse(int.compare))
  |> list.each(fn(index) {
    y_array
    |> delete(index, 1)
  })

  y_array
}

@external(javascript, "../yArray.mjs", "push")
pub fn push(y_array: YArray, items: List(YValue)) -> YArray

@external(javascript, "../yArray.mjs", "unshift")
pub fn unshift(y_array: YArray, items: List(YValue)) -> YArray

pub fn index_of(
  y_array: YArray,
  predicate: fn(YValue) -> Bool,
) -> Result(Int, Nil) {
  index_of_loop(y_array, predicate, 0)
}

pub fn index_of_loop(
  y_array: YArray,
  predicate: fn(YValue) -> Bool,
  index: Int,
) -> Result(Int, Nil) {
  case
    y_array
    |> get(index)
    |> predicate
  {
    True -> Ok(index)
    False ->
      case
        index
        == {
          y_array
          |> length
        }
        - 1
      {
        True -> Error(Nil)
        False -> index_of_loop(y_array, predicate, index + 1)
      }
  }
}

@external(javascript, "../yArray.mjs", "get")
pub fn get(y_array: YArray, index: Int) -> YValue

@external(javascript, "../yArray.mjs", "slice")
pub fn slice(y_array: YArray, start: Int, end: Int) -> YArray

@external(javascript, "../yArray.mjs", "toList")
pub fn to_list(y_array: YArray) -> List(YValue)

@external(javascript, "../yArray.mjs", "toJSON")
pub fn to_json(y_array: YArray) -> BaseType

@external(javascript, "../yArray.mjs", "forEach")
pub fn for_each(y_array: YArray, cb: fn(YValue, Int, YArray) -> Nil) -> YArray

@external(javascript, "../yArray.mjs", "map")
pub fn map(y_array: YArray, cb: fn(YValue, Int, YArray) -> value) -> List(value)

@external(javascript, "../yArray.mjs", "clone")
pub fn clone(y_array: YArray) -> YArray

@external(javascript, "../yArray.mjs", "observe")
pub fn observe(
  y_array: YArray,
  cb: fn(YArrayEvent, Transaction) -> Nil,
) -> fn() -> Nil

@external(javascript, "../yArray.mjs", "observeDeep")
pub fn observe_deep(
  y_array: YArray,
  cb: fn(List(AnyYEvent), Transaction) -> Nil,
) -> fn() -> Nil
